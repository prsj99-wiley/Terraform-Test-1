resource "aws_glue_job" "test-job2" {
  name     = "test-job2"
  role_arn = "arn:aws:iam::239950985641:role/glue-service-role"
  max_retries = "2"
  timeout = 2880

  command {
    script_location = "s3://terraform-state-bucket2-prsj/hello_world.py"
    python_version = "3"
  }
  glue_version = "3.0"
}