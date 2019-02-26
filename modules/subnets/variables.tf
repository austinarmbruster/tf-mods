variable "vpc-tag" {
  description = "The boolean tag name of the VPC in which the reverse proxy should reside."
}

variable "azs" {
  description = "The list of availability zones used to distribute the instances."
  type        = "list"

  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "app-name" {
  description = "the name of the application.  This allows for namespacing the resources"
  type        = "string"
  default     = "app"
}

variable "version" {
  description = "The version of the terraform specifications used to created this infrastructure"
  type        = "string"
  default     = "unknown"
}

variable "subnet-bits" {
  description = "The number of bits to add to the VPC CIDR block for the subnet masks."
  type        = "string"
  default     = "4"
}

variable "subnet-netnum-offset" {
  description = "The number of networks to skip before creating the first subnet."
  type        = "string"
  default     = "0"
}

variable "tags" {
  description = "The mapping of tag names and values to add to both the public and private subnets."
  type        = "map"
  default     = {}
}
