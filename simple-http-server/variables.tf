variable "vpc-tag" {
  description = "The boolean tag name of the VPC in which the HTTP servers should reside."
}

variable "subnet-ids" {
  description = "The subnets in which the Apache HTTP servers should be created."
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

variable "simple-http-server-service-port" {
  description = "Port on the HTTP server instance that is used for service requests"
  type        = "string"
  default     = "80"
}

variable "simple-http-server-health-check-port" {
  description = "Port on the HTTP server instance that is used for health check requests"
  type        = "string"
  default     = "80"
}

variable "simple-http-server-lb-port" {
  description = "Port on the HTTP server load balancer that is used for service requests"
  type        = "string"
  default     = "80"
}
