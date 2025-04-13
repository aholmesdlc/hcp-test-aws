terraform {
  cloud {

    organization = "DLC-HCP"

    workspaces {
      name = "hcp-workspace-aws"
    }
  }

}
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "terraweb1" {
  instance_type = "t2.micro"
  ami           = "ami-04aabd45b36980079"
  key_name      = "kp-4-2-25"
  security_groups = ["sg-015a80c5e8b53fa22"]

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "echo '<html><h1>Provisioned with Terraform 🚀</h1></html>' | sudo tee /var/www/html/index.html"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ec2-user" # or "ubuntu" for Ubuntu AMIs
    private_key = var.private_key_pem
    host        = self.public_ip
  }

}
resource "aws_instance" "terraweb2" {
  instance_type = "t2.micro"
  ami           = "ami-04aabd45b36980079"
  key_name      = "kp-4-2-25"
  security_groups = ["sg-015a80c5e8b53fa22"]

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "echo '<html><h1>Provisioned with Terraform 🚀</h1></html>' | sudo tee /var/www/html/index.html"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ec2-user" # or "ubuntu" for Ubuntu AMIs
    private_key = var.private_key_pem
    host        = self.public_ip
  }
}

