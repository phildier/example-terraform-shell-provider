provider "shell" {
  # If your script requires something sensitive such as credentials, you can
  # inject it into its environment using the sensitive_environment block.  This
  # will be excluded from the state and its output.
  sensitive_environment = {
    API_TOKEN = "abcd"
  }
}

# Create an example bucket for storing a json object
resource "aws_s3_bucket" "example-bucket" {
  bucket = "example-bucket"
}

# Create some example data to store in the object
resource "random_pet" "example-values" {
  for_each = toset(["key1", "key2", "key3", "key4"])
}

# Create an example object in the bucket
resource "shell_script" "example-object" {
  lifecycle_commands {
    create = file("${path.module}/scripts/create.sh")
    read   = file("${path.module}/scripts/read.sh")
    update = file("${path.module}/scripts/update.sh")
    delete = file("${path.module}/scripts/delete.sh")
  }

  environment = {
    BUCKET_NAME = aws_s3_bucket.example-bucket.bucket
    OBJECT_NAME = "example-object.json"
    CONTENTS = jsonencode({
      for k, v in random_pet.example-values : k => v.id
    })
  }
}

output "example-object" {
  value = shell_script.example-object.output
}
