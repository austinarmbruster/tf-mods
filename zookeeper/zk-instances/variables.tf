variable "key-name" {
  description = "The key name used to access the zookeeper servers"
}

variable "vpc-tag" {
  description = "The boolean tag name of the VPC in which the zookeeper should reside."
}

variable "azs" {
  description = "The list of availability zones used to distribute the instances."
  type        = "list"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "zookeeper-url" {
  description = "The URL from which ZooKeeper will be retrieved"
  default     = "http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz"
}

variable "zookeeper-version" {
  description = "The version of ZooKeeper that was retrieved"
  default     = "3.4.13"
}

variable "zookeeper-instance-count" {
  description = "The number of ZooKeeper instances that should be in the cluster"
  default     = 3
}
