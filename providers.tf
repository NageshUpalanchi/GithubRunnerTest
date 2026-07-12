terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0" # Use the latest stable version
    }
  }
}

provider "github" {
  token = var.my_github_token # Authenticates using a Personal Access Token
}