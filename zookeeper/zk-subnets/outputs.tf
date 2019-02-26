output "zookeeper-subnets" {
  value = ["${aws_subnet.zookeeper.*.id}"]
}
