resource "null_resource" "run_ansible_playbook" {

  provisioner "local-exec" {
    command     = "ansible-playbook playbook.yml"
    working_dir = path.module
  }
}