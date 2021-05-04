#------------------------------------------------------------------------------
# ECS Service
#------------------------------------------------------------------------------
variable "name" {
  description = "The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
}

variable "cluster" {
  description = "The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
}

variable "task_definition" {
  description = "The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
}

variable "desired_count" {
  description = "The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  default     = "1"
}

variable "launch_type" {
  description = "The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  default     = "FARGATE"
}

variable "security_groups" {
  description = "The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
}

variable "subnets" {
  description = "The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
}

variable "assign_public_ip" {
  description = "The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  default     = "true"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "target_group_arn" {
  description = ""
  default     = "" 
}

variable "container_name" {
  description = ""
  default     = "" 
}

variable "container_port" {
  description = ""
  default     = {} 
}

variable "elb_name" {
  description = ""
  default     = "" 
}