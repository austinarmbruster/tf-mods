output "public-subnets" {
  value = ["${aws_subnet.common-subnets-public.*.cidr_block}"]
}

output "private-subnets" {
  value = ["${aws_subnet.common-subnets.*.cidr_block}"]
}

output "public-subnet-ids" {
  value = ["${aws_subnet.common-subnets-public.*.id}"]
}

output "private-subnet-ids" {
  value = ["${aws_subnet.common-subnets.*.id}"]
}
