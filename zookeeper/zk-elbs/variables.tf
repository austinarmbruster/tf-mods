variable "vpc-tag" {
  description = "The boolean tag name of the VPC in which the zookeeper should reside."
}

variable "subnet-tag" {
  description = "The boolean tag name of the subnets in which the zookeeper should reside."
}

variable "azs" {
  description = "The list of availability zones used to distribute the instances."
  type        = "list"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "zookeeper-instance-count" {
  description = "The number of ZooKeeper instances that should be in the cluster"
  default     = 3
}
