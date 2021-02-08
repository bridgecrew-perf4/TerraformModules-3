# ---------------------------------------------------------------------------------------------------------------------
# Mandatory variables which need to be set
# ---------------------------------------------------------------------------------------------------------------------

variable "shared_credentials_file" {
  description = "This needs to point to a .aws credential file which is stored/configured on your local laptop"
  type        = string
}

variable "profile" {
  description = "This is usually default but you can create different profiles when configuring your credentials file."
  default     = "default"
  type        = string
}

variable "region" {
  default = "eu-central-1"
}

# ---------------------------------------------------------------------------------------------------------------------
# Network related settings
# ---------------------------------------------------------------------------------------------------------------------

variable "public_ip" {
  default = "true"
}

variable "vpc_id_custom" {
  default = "vpc-b64256de"
}

variable "subnet_id" {
  default = "subnet-e7120b9d"
}

variable "availability_zone" {
  default = "eu-central-1b"
}

variable "server_port" {
  default = "443"
}

# ---------------------------------------------------------------------------------------------------------------------
# Server specific settings
# ---------------------------------------------------------------------------------------------------------------------

variable "env_name" {
  description = "Name of your server, this value will be used for the server name tag and the tag for the security group name."
  type        = string
  default     = "Default_terraform_deployment"
}

variable "volume_size" {
  default = "60"
}

variable "schedule" {
  default = "TESTING"
}

variable "instance_type" {
  default = "t3a.large"
}

#Packer creates two images, a 2016 and 2019 one. In order to always have to most up-to date one, the following options are available. You need to choose one in the next variable.
variable "default_ami" {
  type        = map
  description = "Choose windows 2016 or 2019"
  default = {
    "2016"  = "WIN2016-CUSTOM*"
    "2019"  = "WIN2019-CUSTOM*"
    "linux" = "CentOS Linux 7 x86_64 HVM EBS *"
  }
}

#Above are the options, here you need to make a decision.
variable "ami" {
  description = "You can either choose the 2019 or the 2016 image or the linux image."
  default     = "2019"
}

variable "owner" {
  default = "self"
}