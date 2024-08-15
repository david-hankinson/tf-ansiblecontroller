variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
  default = "terraform-state-s3bucket-21122112"
}

variable "table_name" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default = "terraform-lock-table"
}

variable "region" {
  description = "The AWS region to deploy the S3 bucket and DynamoDB table in."
  type        = string
  default = "ca-central-1"
}

variable "max_size" {
  description = "value of max size for ASG"
  type = number
  default = 2
}