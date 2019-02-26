variable "vpc-tag" {
  description = "The boolean tag name of the VPC in which the zookeeper should reside."
}

variable "azs" {
  description = "The list of availability zones used to distribute the instances."
  type        = "list"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "tags" {
  description = "The mapping of tag names and values to add to the subnet."
  type        = "map"

  default = {
    "zookeeper" = true
  }
}
