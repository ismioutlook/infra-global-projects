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

@app.event_grid_trigger(arg_name="azeventgrid")
def SCEventGridTrigger(azeventgrid: func.EventGridEvent):

    # Retrieve the connection string and container name from environment variables
    logging.info("Dummy function was created with all dependencies."
    )