data "template_cloudinit_config" "cloud-init" {

  gzip = false
  base64_encode = false

  part {
    filename = "init.cfg"
    content_type = "text/cloud-config"
    content = "${file("cloudinit/init.cfg")}"
  }

  part {
    filename = "install.sh"
    content_type = "text/x-shellscript"
    content = "${file("cloudinit/install.sh")}"
  }

}