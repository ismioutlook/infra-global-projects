import os
import logging
import azure.functions as func
import pandas as pd
import time

from datetime import datetime
from io import StringIO
from azure.storage.blob import BlobClient
from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi
from pymongo.errors import OperationFailure


app = func.FunctionApp()

rex_repl_col_map = {
    "Part Number": "skuPartNumber",
    "Part Description": "description",
    "Part Replaced by": "replacedBy",
}

rex_repl_col = ["Part Number", "Part Description", "Part Replaced by"]

rex_atp_col_map = {
    "DIPNO": "skuPartNumber",
    "DIAVL": "availability",
    "DIETA": "availabilityDate",
}


def read_rex_replacement_csv(blob_client, separator):
    """
    Input parameters:
    * csv_file_path: The path to the CSV file containing the REX replacement data.
    * separator: The delimiter used in the CSV file

    Description:
    This function reads a CSV file containing REX replacement data and preprocesses it
    before inserting it into a MongoDB collection

    Returns:
    A Pandas DataFrame containing the preprocessed REX availability data
    """

    blob_data = blob_client.download_blob()
    content = blob_data.readall().decode("utf-8")

    logging.info(f"Reading CSV file")
    # Use pandas to read CSV content
    df = pd.read_csv(StringIO(content), sep=separator, usecols=rex_repl_col)

    logging.info(f"Completed the read of CSV file")

    # Renaming the columns accordingly
    df.rename(columns=rex_repl_col_map, inplace=True)

    # Taking required columns only
    # df = df.loc[
    #     :,
    #     [
    #         "skuPartNumber",
    #         "description",
    #         # "retailPrice",
    #         # "basePrice",
    #         "replacedBy",
    #         # "replacementCode",
    #         # "replacementCodeWhen",
    #     ],
    # ].copy()

    # Setting the "PK"
    # df["_id"] = df["skuPartNumber"]

    # Creating a new column with nested dictionary structure
    # df["replacementInfo"] = df.apply(
    #     lambda row: {
    #         "replacedBy": row["replacedBy"],
    #         "replacementCode": row["replacementCode"],
    #         "replacementCodeWhen": row["replacementCodeWhen"],
    #     },
    #     axis=1,
    # )

    # # Droping the original columns
    # df.drop(
    #     ["replacedBy", "replacementCode", "replacementCodeWhen"],
    #     axis=1,
    #     inplace=True,
    # )
    logging.info(f"Amount of records: {len(df)}")
    return df


def read_rex_availability_csv(blob_client, separator):
    """
    Input parameters:
    * csv_file_path: The path to the CSV file containing the REX availability data.
    * separator: The delimiter used in the CSV file

    Description:
    This function reads a CSV file containing REX availability data and preprocesses it
    before inserting it into a MongoDB collection

    Returns:
    A Pandas DataFrame containing the preprocessed REX availability data
    """
    blob_data = blob_client.download_blob()
    content = blob_data.readall().decode("utf-8")

    logging.info(f"Reading CSV file")
    # Use pandas to read CSV content
    df = pd.read_csv(StringIO(content), sep=separator)

    # Renaming the columns accordingly
    df.rename(columns=rex_atp_col_map, inplace=True)

    # Taking required columns only
    df = df.loc[:, ["skuPartNumber", "availability", "availabilityDate"]].copy()

    # Setting the "PK"
    # df["_id"] = df["skuPartNumber"]

    # Setting the format for the date ingested
    date_format = "%Y%m%d"
    df["availabilityDate"] = pd.to_datetime(df["availabilityDate"], format=date_format)

    # Extract only the date part from the datetime column
    # df["availabilityDate"] = df["availabilityDate"].dt.date

    # Convert datetime objects to string format containing only the date portion
    df["availabilityDate"] = df["availabilityDate"].dt.strftime('%Y-%m-%d')

    # Replacing NaT values with None
    df["availabilityDate"] = (
        df["availabilityDate"]
        .astype(object)
        .where(df["availabilityDate"].notnull(), None)
    )

    print(f"Amount of records: {len(df)}")
    return df


def generate_metrics_log(collection_name):
    """
    Input parameters:
    * collection_name: references the name of the raw REX collection that was updated

    Description:
    The function generates the metric record (one row) for the ingestion to the metrics collection in MongoDB.
    The method returns the pandas dataframe
    """

    # Create the message
    message = f"Raw {collection_name} collection was refreshed"

    # Generate a random ObjectId
    id_timestamp = str(datetime.now().timestamp())

    # Get current datetime
    current_datetime = datetime.now().strftime("%Y-%m-%dT%H:%M")
    
    # Create DataFrame
    data = {
        "_id": id_timestamp,
        "message": message,
        "datetime": current_datetime
    }

    df = pd.DataFrame([data])
    return df


def insert_df(source_csv_df, client, db_name, collection_name, field_to_map, it_step):
    """
    Input parameters:
    * source_csv_df: The DataFrame containing the data to be inserted
    * collection_name: The name of the MongoDB collection to insert the data into
    * it_step: An integer representing the number of records to process in each iteration

    Description:
    The function inserts data from a pandas DataFrame into a MongoDB collection. First, ir accesses the required
    MongoDB collection using the `db[collection_name]` syntax. It then starts a new session using the
    `client.start_session()` method and initializes a few variables to keep track of the current iteration and
    the total number of records to be processed.
    If an error occurs during the execution of the function, it will be caught by the `except` block and the
    transaction will be aborted using `session.abort_transaction()`. The function will then print an
    error message and close the session and MongoDB connection.
    Finally, the function closes the session and MongoDB connection using `session.end_session()` and
    `client.close()`, respectively
    """

    # Accessing requiered db
    db = client[db_name]

    # Accessing requiered collection
    collection = db[collection_name]

    try:
        # Starting a new session
        session = client.start_session()
        logging.info("Starting session")

        count = 0
        total = len(source_csv_df)
        from_idx = 0
        while count < total:
            from_idx = count
            if count + it_step <= total:
                count += it_step
            else:
                count = total

            logging.info(
                f"Processing '{collection_name}' records idexed from {from_idx} to {count}"
            )
            # Reading a subset of data to iterate over
            subset_df = source_csv_df.iloc[from_idx:count]

            values_to_delete = list(subset_df[field_to_map])

            # Constructing a MongoDB query to match documents with the specified values
            query = {field_to_map: {"$in": values_to_delete}}

            # Starting a new trasaction
            session.start_transaction()
            logging.info("Starting transaction")

            current_time = datetime.now()

            logging.info(
                f"Starting the delete iteration for '{collection_name}': {current_time.strftime('%Y-%m-%d %H:%M:%S.%f')}"
            )

            # Deleting documents that match the query
            result = collection.delete_many(query, session=session)

            current_time = datetime.now()
            logging.info(
                f"Delete iteration finished for '{collection_name}': {current_time.strftime('%Y-%m-%d %H:%M:%S.%f')}"
            )

            # Preparing the data for ingestion
            data = subset_df.to_dict(orient="records")

            current_time = datetime.now()
            logging.info(
                f"Starting the ingestion iteration for '{collection_name}': {current_time.strftime('%Y-%m-%d %H:%M:%S.%f')}"
            )

            # Inserting data into the collection
            collection.insert_many(data, session=session)

            current_time = datetime.now()
            logging.info(
                f"Ingestion iteration finished for '{collection_name}': {current_time.strftime('%Y-%m-%d %H:%M:%S.%f')}"
            )

            # Committing the transaction
            session.commit_transaction()
            logging.info("Transaction committed successfully.")

    except OperationFailure as e:
        # If an error occurs, abort the transaction
        logging.info("Error:", e)
        session.abort_transaction()
        logging.info("Transaction aborted.")
    finally:
        # Close the session
        session.end_session()
        logging.info("Session ended.")


@app.event_grid_trigger(arg_name="azeventgrid")
def SCEventGridTrigger(azeventgrid: func.EventGridEvent):

    # Retrieve the connection string and container name from environment variables
    connection_string = os.environ["salescatalogevents_STORAGE"]
    container_name = "salescatalogeventscontainer"

    # Specify the blob name you want to read
    name = azeventgrid.subject
    file_name = name.split("/")[-1]
    directory_name = name.split("/")[-2]  # "CT-REX-ODL-LANDING/"
    blob_name = directory_name + "/" + file_name

    blob_client = BlobClient.from_connection_string(
        conn_str=connection_string, container_name=container_name, blob_name=blob_name
    )

    try:
        loggingCollection = "sc-ecc-metrics"
        if "replacements" in file_name:
            df = read_rex_replacement_csv(blob_client, "|")
            collection_name = "rex-replacement-raw"
            process_step = 100000
        elif "atp" in file_name:
            df = read_rex_availability_csv(blob_client, ",")
            collection_name = "rex-availability-raw"
            process_step = 50000
    except Exception as e:
        logging.error(e)

    mongo_uri = os.environ["MongoUri"]

    try:
        client = MongoClient(mongo_uri, server_api=ServerApi("1"))

        insert_df(
            df,
            client,
            "odl-sales-catalog",
            collection_name,
            "skuPartNumber",
            process_step,
        )

        logging.info(
            f"Data from {blob_name} inserted into MongoDB 'sales-catalog.{collection_name}' collection."
        )

        time.sleep(5)

        metric_df = generate_metrics_log(collection_name)

        insert_df(
            metric_df,
            client,
            "odl-sales-catalog",
            loggingCollection,
            "_id",
            process_step,
        )

        logging.info(
            f"Metrics ingested into MongoDB 'sales-catalog.{loggingCollection}' collection."
        )

    except Exception as e:
        logging.error(e)
    finally:
        client.close()
