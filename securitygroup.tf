resource "aws_security_group" "ssh-zookeeper-kafka" {
  name = "ssh-zookeeper-kafka"
  description = "security group that allows ssh, zookeepear, kafka and all egress traffic"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["${var.IP}"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.IP}"]
    description = "SSH access"
  }

  ingress {
    from_port = 2181
    protocol = "tcp"
    to_port = 2181
    cidr_blocks = ["${var.IP}"]
    description = "Zookeeper access"
  }

  ingress {
    from_port = 9092
    protocol = "tcp"
    to_port = 9092
    cidr_blocks = ["${var.IP}"]
    description = "Kafka PLAINTEXT access"
  }
  tags {
    Name = "allow-ssh"
  }
}
