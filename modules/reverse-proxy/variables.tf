variable "vpc-tag" {
  description = "The boolean tag name of the VPC in which the reverse proxy should reside."
  type        = "string"
}

variable "endpoint" {
  description = "The URL where the reverse proxy should point"
  type        = "string"
}

variable "public-subnet-ids" {
  description = "List of subnet IDs in which the load balancers for the reverse proxy will be placed."
  type        = "list"
}

variable "subnet-ids" {
  description = "List of subnet IDs in which the reverse proxy will run."
  type        = "list"
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

variable "tags" {
  description = "The mapping of tag names and values to add to reverse proxy compontents."
  type        = "map"
  default     = {}
}

variable "reverse-proxy-service-port" {
  description = "Port on the reverse proxy instance that is used for service requests"
  type        = "string"
  default     = "80"
}

variable "reverse-proxy-health-check-port" {
  description = "Port on the reverse proxy instance that is used for health check requests"
  type        = "string"
  default     = "80"
}

variable "reverse-proxy-lb-port" {
  description = "Port on the reverse proxy load balancer that is used for service requests"
  type        = "string"
  default     = "80"
}
