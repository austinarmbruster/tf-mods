variable "vpc-tag" {
  description = "The boolean tag name of the VPC in which the subnets reside."
}

variable "tags" {
  description = "The collection of tag names and values that the subnets must have."
  type        = "map"
}
