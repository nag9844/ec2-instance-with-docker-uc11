output "instance_id" {
  description = "The ID of the web_server EC2 instance"
  value       = aws_instance.web_server.id
}