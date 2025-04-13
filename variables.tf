variable "private_key_pem" {
  description = "SSH private key for EC2 access"
  type        = string
  sensitive   = true
}
