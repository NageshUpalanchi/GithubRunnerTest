terraform {
  backend "s3" {
    bucket = "githubrunnertest-tfstate-123456"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"

    use_lockfile = true
  }
}