resource "aws_ram_principal_association" "this" {
  principal          = var.principal
  resource_share_arn = var.resource_share_arn
}

#resource "time_sleep" "10s_wait" {
#  depends_on = [aws_ram_principal_association.this]
#
#  create_duration = "10s"
#}

resource "time_sleep" "ram_resource_propagation" {
  create_duration = "10s"

  triggers = {
    # This sets up a proper dependency on the RAM association
    resource_share_arn = var.resource_share_arn
    principal  = var.principal
  }
}
