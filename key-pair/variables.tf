variable "key-name" {
  description = "The key name to assign to the key."
}

variable "public-key-file" {
  description = "The file name (including path) contianing the PEM encoded public key."
}

variable "version" {
  description = "The version of the terraform specifications used to created this infrastructure"
  type        = "string"
  default     = "unknown"
}
