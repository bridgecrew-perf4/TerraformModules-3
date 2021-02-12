data "aws_ami" "latest" {
  most_recent = true
  owners      = [var.owner]

  filter {
    name   = "name"
    values = [lookup(var.default_ami, var.ami)]
  }
}

resource "aws_instance" "ec2" {
  count                       = var.instance_count
  ami                         = data.aws_ami.latest.id
  instance_type               = var.instance_type
  user_data                   = var.user_data
  key_name                    = var.key_name
  subnet_id = length(var.network_interface) > 0 ? null : element(
    distinct(compact(concat([var.subnet_id], var.subnet_ids))),
    count.index,
  )
  availability_zone           = var.availability_zone
  associate_public_ip_address = var.public_ip

  ebs_optimized               = var.ebs_optimized

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.volume_size
    delete_on_termination = false
  }
    dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = ebs_block_device.value.device_name
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      kms_key_id            = lookup(ebs_block_device.value, "kms_key_id", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
    }}
        dynamic "network_interface" {
    for_each = var.network_interface
    content {
      device_index          = network_interface.value.device_index
      network_interface_id  = lookup(network_interface.value, "network_interface_id", null)
      delete_on_termination = lookup(network_interface.value, "delete_on_termination", false)
    }
  
      
  }
}
