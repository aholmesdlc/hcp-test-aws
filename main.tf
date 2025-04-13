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
  # (resource arguments)
}
resource "aws_instance" "terraweb2" {
  # (resource arguments)
}
