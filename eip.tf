resource "aws_eip" "elastic_ip" {
  vpc = true
  instance = "${aws_instance.kafka-security.id}"
}