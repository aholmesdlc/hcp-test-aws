terraform { 
  cloud { 
    
    organization = "DLC-HCP" 

    workspaces { 
      name = "hcp-workspace-aws" 
    } 
  } 
  
}
provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "example_server" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformExample"
  }
}
