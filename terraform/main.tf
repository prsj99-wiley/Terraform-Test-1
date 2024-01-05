resource "aws_s3_bucket" "s3Bucket" {
  bucket = "terraform-state-bucket2-prsj"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_glue_trigger" "example" {
  name = "example"
  type = "CONDITIONAL"

  actions {
    job_name = aws_glue_job.example1.name
  }

  predicate {
    conditions {
      job_name = aws_glue_job.example2.name
      state    = "SUCCEEDED"
    }
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