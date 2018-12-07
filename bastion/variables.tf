variable "key-name" {
  description = "The key name used to access the bastion servers"
}

variable "vpc-id" {
  description = "The identifier of the VPC in which the bastion should reside."
}

variable "az-a" {
  default = "us-east-1a"
}

variable "az-b" {
  default = "us-east-1b"
}

variable "region" {
  default = "us-east-1"
}

variable "access_key" {
  default = "YOUR_ACCESS_KEY"
}

variable "secret_key" {
  default = "YOUR_SECRET_KEY"
}
