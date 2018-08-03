resource "aws_instance" "kafka-security" {
  ami = "${var.AMI}"
  instance_type = "${var.INSTANCE}"
  key_name = "${aws_key_pair.mykey.key_name}"
  associate_public_ip_address = true
  security_groups = ["${aws_security_group.allow-ssh.name}"]
  user_data = "${data.template_cloudinit_config.cloud-init.rendered}"

  tags {
    Name = "kafka-security"
  }
}

output "ip" {
  value = "${aws_instance.kafka-security.public_ip}"
}

output "dns" {
  value = "${aws_instance.kafka-security.public_dns}"
}

output "security_groups" {
  value = "${aws_instance.kafka-security.security_groups}"
}