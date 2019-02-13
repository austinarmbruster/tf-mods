variable "vpc-tag" {
  description = "The boolean tag name of the VPC in which the reverse proxy should reside."
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
