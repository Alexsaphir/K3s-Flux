locals {
  # avatar_dir = "${path.module}/data/topics"
}

resource "gitlab_topic" "docker" {
  name  = "Docker"
  title = "Docker"
  # avatar      = local.avatar_docker
  # avatar_hash = local.avatar_docker != null ? filesha256(local.avatar_docker) : null
}

resource "gitlab_topic" "python" {
  name  = "Python"
  title = "Python"
}

resource "gitlab_topic" "ansible" {
  name  = "Ansible"
  title = "Ansible"
}

resource "gitlab_topic" "zotero" {
  name  = "Zotero"
  title = "Zotero"
}

resource "gitlab_topic" "kubernetes" {
  name  = "Kubernetes"
  title = "Kubernetes"
}

resource "gitlab_topic" "lean" {
  name  = "LEAN"
  title = "LEAN"
}

resource "gitlab_topic" "latex" {
  name  = "LaTeX"
  title = "LaTeX"
}

resource "gitlab_topic" "sql" {
  name  = "SQL"
  title = "SQL"
}

resource "gitlab_topic" "docker-compose" {
  name  = "Docker-Compose"
  title = "Docker-Compose"
}

resource "gitlab_topic" "iac" {
  name  = "IaC"
  title = "IaC"
}

resource "gitlab_topic" "flux" {
  name  = "Flux"
  title = "Flux"
}

resource "gitlab_topic" "helm" {
  name  = "Helm"
  title = "Helm"
}

resource "gitlab_topic" "cpp" {
  name  = "C++"
  title = "C++"
}

resource "gitlab_topic" "flask" {
  name  = "Flask"
  title = "Flask"
}

resource "gitlab_topic" "fastapi" {
  name  = "FastAPI"
  title = "FastAPI"
}
