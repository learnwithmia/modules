resource "azurerm_subscription_policy_assignment" "this" {
  for_each = { for each in var.policies : each.name => each }
  name                 = each.value.name
  policy_definition_id = each.value.policy_definition_id
  subscription_id      = each.value.subscription_id
  enforce              = each.value.enforce ? each.value.enforce : null
  parameters           = each.value.parameter_type ? jsonencode({
    (each.value.parameter_name) = {
      type  = (each.value.parameter_type)
      value = (each.value.parameter_value)
    }
  }) : null
  lifecycle {
    ignore_changes = [ parameters ]
  }
}
