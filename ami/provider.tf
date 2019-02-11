provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
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
