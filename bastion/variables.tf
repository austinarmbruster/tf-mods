variable "key-name" {
  description = "The key name used to access the bastion servers"
}

variable "vpc-id" {
  description = "The identifier of the VPC in which the bastion should reside."
}

variable "azs" {
  description = "The list of availability zones used to distribute the instances."
  type        = "list"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "subnet-cidrs" {
  description = "The list of subnet CIDRs used in the creation of subnets in each AZ.  The length of subnet-dicrs must be equal to or greater than the length of availability zones."
  type        = "list"
  default     = ["10.1.2.0/25", "10.1.2.128/25"]
}
