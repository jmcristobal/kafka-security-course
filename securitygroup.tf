resource "aws_security_group" "allow-ssh" {
  name = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  ingress {
    from_port = 2181
    protocol = "tcp"
    to_port = 2181
    cidr_blocks = ["0.0.0.0/0"]
    description = "Zookeeper access"
  }

  ingress {
    from_port = 9092
    protocol = "tcp"
    to_port = 9092
    cidr_blocks = ["0.0.0.0/0"]
    description = "Kafka PLAINTEXT access"
  }
  tags {
    Name = "allow-ssh"
  }
}
