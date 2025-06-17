resource "aws_instance" "web_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = var.security_group
  key_name        = var.key_name # Allow SSH access

  tags = {
    Name        = "ec2-server"
  }

  user_data = <<-EOF
                #!/bin/bash
                set -e
                
                # Update and install Nginx
                apt update -y
                apt install -y nginx
                apt-get install -y docker.io
                systemctl start docker
                systemctl enable docker
                usermod -aG docker ubuntu
                
                # Enable and start Nginx
                systemctl enable nginx
                systemctl start nginx
                
                # Create custom index.html
                cat <<EOT > /var/www/html/index.html
                <!DOCTYPE html>
                <html>
                <head>
                   <title>Welcome to Nginx</title>
                </head>
                <body>
                   <h1>Hello from $(hostname)!</h1>
                   <p>Nginx is successfully installed on your Ubuntu server.</p>
                </body>
                </html>
                EOT
                
                # Set ownership and permissions
                chown -R www-data:www-data /var/www/html/
                chmod -R 755 /var/www/html/
                
                # Restart nginx
                systemctl restart nginx
                EOF

}