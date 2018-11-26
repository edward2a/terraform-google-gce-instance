output "instance_id" {
  description = ""
  value = "${google_compute_instance.vm.*.instance_id}"
}

output "self_link" {
  description = ""
  value = "${google_compute_instance.vm.*.self_link}"
}

output "internal_network_ip" {
  description = ""
  value = "${google_compute_instance.vm.*.network_interface.0.network_ip}"
}

/*
output "external_network_ip" {
  description = ""
  value = "${var.private_ip ? "" : google_compute_instance.vm.*.access_config.0.nat_ip}"
}
*/
