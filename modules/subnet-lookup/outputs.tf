output "subnets" {
  description = "Provides the Network CIDRs for the subnets that were requested."
  value       = ["${data.aws_subnet.subnet-lookup.*.cidr_block}"]
}

output "subnet-ids" {
  description = "Provides the AWS IDs for the subnets that were requested."
  value       = ["${data.aws_subnet.subnet-lookup.*.id}"]
}
