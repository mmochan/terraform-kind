resource "kubernetes_namespace" "processing" {
  metadata {
    name = "processing"

    labels = {
      managed-by = "Terraform"
    }
  }
}

resource "kubernetes_namespace" "argo_events" {
  metadata {
    name = "argo-events"

    labels = {
      managed-by = "Terraform"
    }
  }
}

resource "kubernetes_namespace" "crossplane" {
  metadata {
    name = "crossplane"

    labels = {
      managed-by = "Terraform"
    }
  }
}

resource "kubernetes_namespace" "admin" {
  metadata {
    name = "admin"

    labels = {
      managed-by = "Terraform"
    }
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"

    labels = {
      managed-by = "Terraform"
    }
  }
}

resource "kubernetes_namespace" "backstage" {
  metadata {
    name = "backstage"

    labels = {
      managed-by = "Terraform"
    }
  }
}
