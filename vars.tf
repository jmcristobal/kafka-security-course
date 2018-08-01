variable "AWS_REGION" {
  default = "eu-west-2"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "keys/mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "keys/mykey.pub"
}
variable "AMI" {
  default = "ami-b8956b53"
}
variable "INSTANCE" {
  default = "t2.large"
}