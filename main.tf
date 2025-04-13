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
  user_data     = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd

              echo "<html><h1>Deployed by Terraform 🚀</h1></html>" > /var/www/html/index.html
              EOF
}
resource "aws_instance" "terraweb2" {
  instance_type = "t2.micro"
  ami           = "ami-04aabd45b36980079"
}

