###cloud vars

variable cloud {
  type = map(object({
    cloud_id = string
    folder_id = string
    default_zone = string
    vpc_name = string
  }))
    default = { 
      "netology" = {
        cloud_id = "b1g8lmno7t06ve55gp10"
        folder_id = "b1g8bp1nfdm701n4tb5g"
        default_zone = "ru-central1-a"
        vpc_name = "netology"
      }
  }
}

variable "token"{
  type        = string
  description = "enter secret token"
}

#servuce account
variable "sa_name" {
  type        = string
  default     = "lamp-serviceuser"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-vpc-user" {
  folder_id = var.cloud.netology.folder_id
  role      = "vpc.user"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.cloud.netology.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

#resource "yandex_resourcemanager_folder_iam_member" "sa_compute_admin" {
#  folder_id = var.cloud.netology.folder_id
#  role      = "compute.admin"
#  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
#}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIL089Y5GGOpFLjqBNjSOe0D1Hiuti6VD5ObRVeiGFg9 root@net1"
  description = "ssh-keygen -t ed25519"
}

variable vm {
  type = map(object({
    name = string
    groupname = string
    cores = number
    memory = number
    core_fraction = number
    zone = string
    image = string
    network_cidr = list(string)
    boot_disk_size = number
    preemptible = bool
    nat = bool
  }))
    default = { 
      "private" = {
        name = "private"
        groupname = "lamp-group"
        cores = 2
        memory = 1
        core_fraction = 5
        image = "fd827b91d99psvq5fjit"
        zone = "ru-central1-b"
        network_cidr = ["192.168.20.0/24"]
        boot_disk_size = 10
        preemptible = true
        nat = false
     }
  }
}

variable lamp {
  type = map(object({
    max_unavailable = number
    max_expansion = number
    interval = number
    timeout = number
    healthy_threshold = number
    unhealthy_threshold = number
    port = number
    size = number
  }))
  default = {
    "private" = {
      max_unavailable = 1
      max_expansion = 3
      interval = 10
      timeout = 5
      healthy_threshold = 2
      unhealthy_threshold = 2
      port = 80
      size = 3
    }
  }
}

variable balancer {
  type = map(object({
    name = string
    listener_name = string
    listener_port = number
  }))
  default = {
    "private" = {
      name = "private"
      listener_name = "public"
      listener_port = 80
    }
  }
}

