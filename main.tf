locals {
  default_boot_disk_setup = {
    auto_delete = "true"
    initialize_params = [{
      image = "${var.system_image}"
      size = "${var.system_disk_size}"
      type = "${var.system_disk_type}"
    }]
  }
}

resource "google_compute_instance" "vm" {
  count = "${var.private_ip ? 1 : 0}"
  name = "${var.name}"
  machine_type = "${var.machine_type}"
  allow_stopping_for_update = "${var.allow_stopping_for_update}"
  zone = "${var.zone}"
  service_account = "${var.service_account_list}"

  boot_disk = ["${merge(local.default_boot_disk_setup, var.boot_disk_setup)}"]

  network_interface {
    network_ip = "${var.private_ip_address}"
    subnetwork = "${var.subnetwork}"
    subnetwork_project = "${var.host_project}"
  }

  scheduling {
    preemptible = "${var.preemptible}"
    on_host_maintenance = "${var.host_maintenance_action}"
    automatic_restart = "${var.automatic_restart}"
  }

  labels = "${var.labels}"
  metadata = "${var.metadata}"
  metadata_startup_script = "${var.startup_script}"
}

/* commented until tf 0.12 is available */
/*
resource "google_compute_instance" "vm" {
  count = "${var.private_ip ? 0 : 1}"
  name = "${var.name}"
  machine_type = "${var.machine_type}"
  zone = "${var.zone}"

  boot_disk = "${merge(local.default_boot_disk_setup, var.boot_disk_setup)}"

  network_interface {
    network_ip = "${var.private_ip_address}"
    subnetwork = "${var.subnetwork}"
    subnetwork_project = "${var.host_project}"
  }

  scheduling {
    preemptible = "${var.preemptible}"
    on_host_maintenance = "${var.host_maintenance_action}"
    automatic_restart = "${var.automatic_restart}"
  }

  access_config {
    nat_ip = "${var.nat_ip}"
    public_ptr_domain_name = "${var.public_ptr_domain_name}"
    network_tier = "${var.network_tier}"
  }
}
*/
