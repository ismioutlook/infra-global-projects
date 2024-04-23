data "azurerm_subscription" "current" {
}

data "archive_file" "function" {
  type        = "zip"
  excludes    = split("\n", file("${path.root}/src/.funcignore"))
  source_dir  = "${path.root}/src"
  output_path = "${path.root}/package.zip"
}

