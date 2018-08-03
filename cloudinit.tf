data "template_file" "init-script" {
  template = "${file("cloudinit/init.cfg")}"
}

data "template_cloudinit_config" "cloud-init" {
  "part" {
    filename = "init.cfg"
    content_type = "text/cloud-config"
    content = "${data.template_file.init-script.rendered}"
  }
}