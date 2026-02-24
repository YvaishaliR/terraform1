data "azurerm_policy_definition" "require_environment_tag" {
  display_name = "Require a tag on resources"
}

resource "azurerm_management_group_policy_assignment" "corp_require_tag" {
  name                 = "require-environment-tag"
  management_group_id = var.management_group_id
  policy_definition_id = data.azurerm_policy_definition.require_environment_tag.id

  parameters = jsonencode({
    tagName = {
      value = "environment"
    }
  })
}
