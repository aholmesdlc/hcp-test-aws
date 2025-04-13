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
}
resource "aws_instance" "terraweb2" {
  instance_type = "t2.micro"
  ami           = "ami-04aabd45b36980079"
}

