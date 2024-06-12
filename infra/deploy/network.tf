resource "aws_vpc" "main" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

##########################################################
# Policy for Terraform backend to S3 and DynamoDB access #
##########################################################
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    name = "${local.prefix}-main"
  }
}