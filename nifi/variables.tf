variable "key-name" {
  description = "The key name used to access the nifi servers"
}

variable "vpc-tag" {
  description = "The boolean tag name of the VPC in which the nifi should reside."
}

variable "azs" {
  description = "The list of availability zones used to distribute the instances."
  type        = "list"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "nifi-url" {
  description = "The URL from which NiFi will be retrieved"
  default     = "http://apache.mirrors.pair.com/nifi/1.8.0/nifi-1.8.0-bin.tar.gz"
}
