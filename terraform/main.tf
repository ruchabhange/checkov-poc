## Create VPC
resource "google_compute_network" "vpc" {
     name                    = "${var.name}-vpc"
     auto_create_subnetworks = "false"
 }


 ## Create Subnet
 ##  Create public subnet  

resource "google_compute_subnetwork" "pub-subnet" {
     name          = "${var.name}-public-subnet"
     ip_cidr_range = "${var.pub-subnet-cidr}"
     network       = "${var.name}-vpc"
     depends_on    = [google_compute_network.vpc]
     region        = var.region
    }

## Create private subnet

resource "google_compute_subnetwork" "private-subnet" {
     name          = "${var.name}-private-subnet"
     ip_cidr_range = "${var.private-subnet-cidr}"
     network       = "${var.name}-vpc"
     depends_on    = [google_compute_network.vpc]
     region        = var.region
     private_ip_google_access = "true"
    }
##### Create vm instance

resource "google_compute_instance" "default" {
name = "${var.name}-instance"
machine_type = "f1-micro"
zone         = "us-central1-a"
boot_disk {
     initialize_params {
         image = "debian-cloud/debian-11"
         }
     }   
network_interface {
    subnetwork = google_compute_subnetwork.pub-subnet.name
    }
}
