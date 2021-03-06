variable "key-name" {
  description = "The key name used to access the bastion servers"
}

variable "vpc-tag" {
  description = "The boolean tag name of the VPC in which the bastion should reside."
}

variable "azs" {
  description = "The list of availability zones used to distribute the instances."
  type        = "list"
  default     = ["us-east-1a", "us-east-1b"]
}
