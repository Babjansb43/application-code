output "cicdip" {
  value = aws_instance.cicd.public_ip

}

output "cicdpubdns" {
  value = aws_instance.cicd.public_dns

}

# output "apacheip" {
#   value = aws_instance.apache.public_ip

# }

# output "apachepubdns" {
#   value = aws_instance.apache.public_dns

# }
