# Configure the Google Cloud provider
provider "google" {
  project = var.GOOGLE_PROJECT_ID
  region  = "us-east1"
}

# Create a Google Compute Firewall
resource "google_compute_firewall" "instance" {
  name    = var.VM_NAME
  network = "default"

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports = ["8000"]
  }
}

# Create a Google Compute instance
resource "google_compute_instance" "example" {
  name         = var.VM_NAME
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  tags = ["terraform-example","utkarsh-codepipes-testing"]

  metadata_startup_script = "echo 'Hello, Team Code Pipes, Your Automation works!!!' > index.html ; nohup busybox httpd -f -p 8000 &"
}
