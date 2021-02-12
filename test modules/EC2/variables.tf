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
variable "network_interface" {
  description = "Customize network interfaces to be attached at instance boot time"
  type        = list(map(string))
  default     = []
}

variable "public_ip" {
  default = "true"
}

variable "vpc_id_custom" {
  default = "vpc-b64256de"
}

variable "subnet_id" {
  default = "subnet-e7120b9d"
}

variable "subnet_ids" {
  description = "A list of VPC Subnet IDs to launch in"
  type        = list(string)
  default     = []
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
variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = false
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = ""
}

variable "user_data" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  type        = string
  default     = null
}

variable "name" {
  description = "Name of your server, this value will be used for the server name tag and the tag for the security group name."
  type        = string
  default     = "Default_terraform_deployment"
}

variable "volume_size" {
  default = "60"
}

variable "instance_type" {
  default = "t3a.large"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(map(string))
  default     = []
}

#Packer creates two images, a 2016 and 2019 one. In order to always have to most up-to date one, the following options are available. You need to choose one in the next variable.
variable "default_ami" {
  type        = map
  description = "Choose windows 2016 or 2019"
  default = {
    "2016"  = "WIN2016-CUSTOM*"
    "2019"  = "WIN2019-CUSTOM*"
    "linux" = "CentOS-CUSTOM*"
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
