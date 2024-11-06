terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.32"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_launch_configuration" "example" {
  name          = "example-lc"
  image_id      = "ami-01376101673c89611"
  instance_type = "t2.micro"
  enable_monitoring = false
}

resource "aws_autoscaling_group" "example" {
  max_size             = 3
  min_size             = 1
  availability_zones   = ["ap-south-1a"]
  launch_configuration = aws_launch_configuration.example.name
}
