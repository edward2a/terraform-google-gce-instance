variable "private_ip" { default = "true" }
variable "name" {}
variable "machine_type" { default = "f1-micro" }
variable "allow_stopping_for_update" { default = "true" }
variable "zone" {}
variable "service_account_list" { type = "list" default = [] }
variable "boot_disk_setup" { type = "map" default = {}}
variable "system_image" { default = "debian-cloud/debian-9" }
variable "system_disk_size" { default = 10 }
variable "system_disk_type" { default = "pd-ssd" }
variable "subnetwork" { default = "" }
variable "host_project" { default = "" }
variable "preemptible" { default = "false" }
variable "host_maintenance_action" { default = "MIGRATE" }
variable "automatic_restart" { default = "true" }
variable "private_ip_address" { default = "" }
variable "labels" { type = "map" default = {} }
variable "metadata" { type = "map" default = {} }
variable "startup_script" { default = "" }

/*
# For publicly accessible setup
variable "nat_ip" { default = "" }
variable "public_ptr_domain_name" { default = "" }
variable "network_tier" { default = "PREMIUM" }
*/
