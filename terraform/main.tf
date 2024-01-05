resource "aws_s3_bucket" "s3Bucket" {
  bucket = "terraform-state-bucket2-prsj"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_glue_job" "est-job1" {
  name     = "test-job1"
  role_arn = "arn:aws:iam::239950985641:role/glue-service-role"
  max_retries = "1"
  timeout = 2880

  command {
    script_location = "s3://terraform-state-bucket2-prsj/hello_world.py"
    python_version = "3"
  }
}

# resource "aws_s3_bucket" "s3Bucket" {
#      bucket = "terraform-state-bucket2-prsj"
#      acl       = "public-read"

#      policy  = <<EOF
# {
#      "id" : "MakePublic",
#    "version" : "2012-10-17",
#    "statement" : [
#       {
#          "action" : [
#              "s3:GetObject"
#           ],
#          "effect" : "Allow",
#          "resource" : "arn:aws:s3:::terraform-state-bucket2-prsj/*",
#          "principal" : "*"
#       }
#     ]
#   }
# EOF

#    website {
#        index_document = "index.html"
#    }
# }