provider "aws" {
  region = "us-east-1"
}

locals {
  env = "dev"
}

# Security Group #################################
resource "aws_security_group" "tom_ssh_http" {

  name = "${local.env}-ssh-http"
  description = "Allow ssh and http trafic"
  vpc_id = var.TOM_VPC

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow MYSQL Port"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2-SSH-HTTP-MYSQL"
  }
}



# SSH Key Pare ########################################
resource "aws_key_pair" "tom-key" {
  key_name   = "${local.env}-default"
  public_key = file(var.TOM_PUB_KEY)
}



# EC2 Instance ########################################
resource "aws_instance" "tom-instance" {
  
  ami = var.TOM_EC2_AMI
  
  key_name 	= "${local.env}-default"
  
  instance_type = var.TOM_EC2_TYPE
  
  vpc_security_group_ids = [aws_security_group.tom_ssh_http.id]

  provisioner "file" {
    source      = "nginx.default"
    destination = "/tmp/nginx.default"
  }

  connection {
    type        = "ssh"
    user        = var.TOM_EC2_USER
    private_key = file(var.TOM_PRV_KEY)
    host        = self.public_dns
  }

  user_data = file(var.TOM_EC2_SH_SCRIPTS)
  
  tags = {
    "Name" = var.TOM_EC2_TAG
  }
}


## RDS Security Group ###########################################
resource "aws_security_group" "tom_rds_mysq" {

  name = "${local.env}-rds-mysql"
  description = "Allow 3306 MySQL Port"
  vpc_id = var.TOM_VPC
  
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.tom_ssh_http.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS-EC2"
  }

}

# Create RDS instance ########################################
resource "aws_db_instance" "tom_wpdb" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro" 
  vpc_security_group_ids = [aws_security_group.tom_rds_mysq.id]
  db_name                = var.TOM_DB_NAME
  username               = var.TOM_DB_USER
  password               = var.TOM_DB_PASS
  skip_final_snapshot    = true
}