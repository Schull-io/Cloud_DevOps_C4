terraform {
  backend "s3" {
    bucket = "statebackend1698" 
    dynamodb_table = "state-lock"
    key    = "global/mys-statefile/terraform.tfstate" 
    region = "eu-west-2" 
    encrypt = true
  
  }
}

