resource "kind_cluster" "default" {
  name           = "cluster-1"
  node_image     = "kindest/node:v1.27.3"
  wait_for_ready = true
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    node {
      role = "control-plane"
    }

    node {
      role  = "worker"
      image = "kindest/node:v1.27.3"
    }

    node {
      role  = "worker"
      image = "kindest/node:v1.27.3"
    }

    node {
      role  = "worker"
      image = "kindest/node:v1.27.3"
    }
  }
}

resource "helm_release" "argocd" {
  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "5.44.0"
  create_namespace = true
}

resource "helm_release" "argocd_apps" {
  name = "apps"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argocd-apps"
  namespace        = "argocd"
  version          = "1.4.1"
  create_namespace = true

  values = [
    file("argocd/application.yaml")
  ]

  depends_on = [helm_release.argocd]
}
