provider "docker" {
  host = "ssh://master@51.250.14.51"
}

resource "docker_container" "mysql" {
  image = "mysql:8"
  name  = "mysql-container"
  ports {
    internal = 3306
    external = 3306
  }
  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.mysql_root_password.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.mysql_user_password.result}",
    "MYSQL_ROOT_HOST=%"
  ]
}

resource "random_password" "mysql_root_password" {
  length  = 16
  special = true
}

resource "random_password" "mysql_user_password" {
  length  = 16
  special = true
}

output "mysql_root_password" {
  value = random_password.mysql_root_password.result
  sensitive = true
}

output "mysql_user_password" {
  value = random_password.mysql_user_password.result
  sensitive = true
}
