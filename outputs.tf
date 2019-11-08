output "alb_dns_name" {
  value       = aws_lb.prueba.dns_name
  description = "The domain name of the load balancer"
}