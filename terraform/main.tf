resource "aws_s3_bucket" "s3Bucket" {
  bucket = "terraform-state-bucket2-prsj"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_glue_job" "example" {
  name     = "example"
  role_arn = aws_iam_role.example.arn

  command {
    script_location = "s3://terraform-state-bucket2-prsj/hello_world.py"
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