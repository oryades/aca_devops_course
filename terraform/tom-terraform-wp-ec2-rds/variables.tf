# Insert your AWS VPC ID for the default = "" attribute, e.g. vpc-078b#########
variable "TOM_VPC" {
    type = string
    default = ""
}

variable "TOM_PUB_KEY" {
    type = string
    default = "~/.ssh/id_rsa.pub"
}

variable "TOM_PRV_KEY" {
    type = string
    default = "~/.ssh/id_rsa"
}

variable "TOM_EC2_USER" {
    type = string
    default = "ubuntu"
}

variable "TOM_EC2_AMI" {
    type = string
    default = "ami-052efd3df9dad4825"
}

variable "TOM_EC2_TYPE" {
    type = string
    default = "t2.micro"
}

variable "TOM_EC2_TAG" {
    type = string
    default = "tom-nginx-1"
}

variable "TOM_EC2_SH_SCRIPTS" {
    type = string
    default = "setup.sh"
}


variable "TOM_DB_NAME" {
    type = string
    default = "wpdb"
}
variable "TOM_DB_USER" {
    type = string
    default = "tom"
}
variable "TOM_DB_PASS" {
    type = string
    default = "awdxz123"
}
