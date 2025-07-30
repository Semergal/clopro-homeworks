# Вывод ID виртуальной сети
output "vpc_network_id" {
  value       = yandex_vpc_network.VPC.id
  description = "ID созданной виртуальной сети (VPC)"
}

# Вывод подсетей
output "private_subnet_a_id" {
  value       = yandex_vpc_subnet.private_a.id
  description = "ID приватной подсети в зоне ru-central1-a"
}

output "private_subnet_b_id" {
  value       = yandex_vpc_subnet.private_b.id
  description = "ID приватной подсети в зоне ru-central1-b"
}

output "public_subnet_a_id" {
  value       = yandex_vpc_subnet.public_a.id
  description = "ID публичной подсети в зоне ru-central1-a"
}

output "public_subnet_b_id" {
  value       = yandex_vpc_subnet.public_b.id
  description = "ID публичной подсети в зоне ru-central1-b"
}

output "public_subnet_d_id" {
  value       = yandex_vpc_subnet.public_d.id
  description = "ID публичной подсети в зоне ru-central1-d"
}

# Вывод данных о кластере MySQL
output "mysql_cluster_id" {
  value       = yandex_mdb_mysql_cluster.test_cluster.id
  description = "ID кластера MySQL"
}

output "mysql_cluster_name" {
  value       = yandex_mdb_mysql_cluster.test_cluster.name
  description = "Имя кластера MySQL"
}

output "mysql_cluster_host_fqdn" {
  value       = yandex_mdb_mysql_cluster.test_cluster.host[*].fqdn
  description = "FQDN хостов кластера MySQL"
}

output "mysql_database_name" {
  value       = yandex_mdb_mysql_database.netology_db.name
  description = "Имя созданной базы данных"
}

output "mysql_user_name" {
  value       = yandex_mdb_mysql_user.dbuser.name
  sensitive   = true
  description = "Имя пользователя MySQL"
}

output "mysql_user_password" {
  value       = yandex_mdb_mysql_user.dbuser.password
  sensitive   = true
  description = "Пароль пользователя MySQL"
}

# Вывод данных о сервисном аккаунте
output "service_account_id" {
  value       = yandex_iam_service_account.k8s.id
  description = "ID сервисного аккаунта для Kubernetes"
}

output "service_account_name" {
  value       = yandex_iam_service_account.k8s.name
  description = "Имя сервисного аккаунта"
}

# Вывод данных о KMS-ключе
output "kms_key_id" {
  value       = yandex_kms_symmetric_key.encryptkey.id
  description = "ID KMS-ключа для шифрования"
}

output "kms_key_status" {
  value       = yandex_kms_symmetric_key.encryptkey.status
  description = "Статус KMS-ключа"
}

# Вывод данных о кластере Kubernetes
output "kubernetes_cluster_id" {
  value       = yandex_kubernetes_cluster.regional-k8s.id
  description = "ID кластера Kubernetes"
}

output "kubernetes_cluster_name" {
  value       = yandex_kubernetes_cluster.regional-k8s.name
  description = "Имя кластера Kubernetes"
}

output "kubernetes_cluster_endpoint" {
  value       = yandex_kubernetes_cluster.regional-k8s.master[0].external_v4_endpoint
  description = "Endpoint кластера Kubernetes"
}

output "kubernetes_cluster_version" {
  value       = yandex_kubernetes_cluster.regional-k8s.master[0].version
  description = "Версия Kubernetes"
}

output "kubernetes_cluster_public_ip" {
  value       = yandex_kubernetes_cluster.regional-k8s.master[0].external_v4_endpoint
  description = "Публичный IP-адрес master-ноды кластера Kubernetes"
}

# Вывод данных о группе узлов
output "node_group_id" {
  value       = yandex_kubernetes_node_group.k8s-node-group-a.id
  description = "ID группы узлов Kubernetes"
}

output "node_group_node_count" {
  value       = yandex_kubernetes_node_group.k8s-node-group-a.scale_policy.0.auto_scale.0.initial
  description = "Начальное количество узлов в группе"
}

output "node_group_min_count" {
  value       = yandex_kubernetes_node_group.k8s-node-group-a.scale_policy.0.auto_scale.0.min
  description = "Минимальное количество узлов в группе"
}

output "node_group_max_count" {
  value       = yandex_kubernetes_node_group.k8s-node-group-a.scale_policy.0.auto_scale.0.max
  description = "Максимальное количество узлов в группе"
}

output "node_group_labels" {
  value       = yandex_kubernetes_node_group.k8s-node-group-a.labels
  description = "Labels группы узлов"
}