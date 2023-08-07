// Create S3 bucket for state backend
resource "aws_s3_bucket" "danniebucket" {
   bucket = "1statebackend1698"


  
}

resource "aws_s3_bucket_versioning" "danniebucket_versioning" {
  bucket = aws_s3_bucket.danniebucket.bucket
    versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "danniebucket_sse" {
  bucket = aws_s3_bucket.danniebucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

// Create IAM role for the web server
resource "aws_iam_role" "webserver_role" {
  name = "WebServerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

// Attach AmazonS3FullAccess policy to the web server IAM role
resource "aws_iam_role_policy_attachment" "webserver_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"  
  role       = aws_iam_role.webserver_role.name
}





