# VPC Network
resource "yandex_vpc_network" "terraform-network" {
  name = var.vpc_name
}

# Public Subnet
resource "yandex_vpc_subnet" "subnet_public" {
  name           = "public"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.terraform-network.id
  v4_cidr_blocks = [var.public_cidr]
}

# Private Subnet with Route Table
resource "yandex_vpc_route_table" "private_route_table" {
  name       = "private-route-table"
  network_id = yandex_vpc_network.terraform-network.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254" # NAT instance IP
  }
}

resource "yandex_vpc_subnet" "subnet_private" {
  name           = "private"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.terraform-network.id
  v4_cidr_blocks = [var.private_cidr]
  route_table_id = yandex_vpc_route_table.private_route_table.id
}

# NAT Instance
resource "yandex_compute_instance" "nat-instance" {
  name = "nat-instance"
  zone = var.default_zone

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_public.id
    ip_address = "192.168.10.254"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }
}

# Public VM
resource "yandex_compute_instance" "public-vm" {
  name = "public-vm"
  zone = var.default_zone

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_public.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }
}

# Private VM
resource "yandex_compute_instance" "private-vm" {
  name = "private-vm"
  zone = var.default_zone

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_private.id
    ip_address = "192.168.20.10"
  }

  metadata = {
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }
}