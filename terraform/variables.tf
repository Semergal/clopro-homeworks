###cloud vars
variable "token" {
  type        = string
### default     = ""
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = "b1g8lmno7t06ve55gp10"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g8bp1nfdm701n4tb5g"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "public_cidr" {
  type        = string
  default     = "192.168.10.0/24"
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "private_cidr" {
  type        = string
  default     = "192.168.20.0/24"
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIL089Y5GGOpFLjqBNjSOe0D1Hiuti6VD5ObRVeiGFg9 root@net1"
  description = "ssh-keygen -t ed25519"
}
