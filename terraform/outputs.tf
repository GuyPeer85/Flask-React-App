output "service_ipv4" {
  value = aws_ecs_service.flask_react_app_service.service_registries[0].container_name
}

output "service_dns_name" {
  value = aws_lb.flask_react_app_alb.dns_name
}