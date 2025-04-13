terraform { 
  cloud { 
    
    organization = "DLC-HCP" 

    workspaces { 
      name = "hcp-workspace-aws" 
    } 
  } 
  
}
provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "terraweb1" {
  instance_type = "t2.micro"  
  ami = "ami-04aabd45b36980079"
}
resource "aws_instance" "terraweb2" {
  instance_type = "t2.micro"   
  ami = "ami-04aabd45b36980079"
}
resource "aws_lb" "terraweb-lb" {
  name               = "terraweb-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = "sg-015a80c5e8b53fa22"
  subnets            = ["subnet-0de5d0617ce4b24a6","subnet-03cde2875fcc4238b"]

  enable_deletion_protection = false
}
resource "aws_lb_listener" "http" {
  # (resource arguments)
}

