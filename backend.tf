terraform {
  backend "s3" {
    bucket = "mahi-terraform-state"
    key = "instances/ec2"
    region = "us-west-2"
  }
}
