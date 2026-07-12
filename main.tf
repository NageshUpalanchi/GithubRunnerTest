resource "aws_instance" "app_server" {
  # Core Configuration
  ami           = "ami-01a00762f46d584a1"
  instance_type = "c7i-flex.large"
  key_name      = "GitHubRunner"

  # Networking
  subnet_id                   = "subnet-01be31ea88cea9678"
  vpc_security_group_ids      = ["sg-0f954644d808bd3fc"]
  associate_public_ip_address = true

  # Storage Configuration (Root Volume)
  root_block_device {
    volume_size           = 30
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  # Startup Script
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  # Safeguards
  disable_api_termination = false

  # Metadata Tracking
  tags = {
    Name        = "Production-App-Server"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}