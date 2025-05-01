terraform {
  required_version = ">= 1.8"

  required_providers {
    shell = {
      source  = "scottwinkler/shell"
      version = "~> 1.7"
    }
  }
}

provider "aws" {
  # mock credentials for localstack
  access_key = "mock_access_key"
  secret_key = "mock_secret_key"

  region = "us-east-1"

  # these options are necessary for localstack
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}
