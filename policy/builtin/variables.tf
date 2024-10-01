variable "policies" {
  type = list(object({
    name                        = string
    policy_definition_id        = string
    subscription_id             = string
    parameter_name              = optional(string, null)
    parameter_type              = optional(string, null)
    parameter_value             = optional(string, null)
    enforce                     = optional(bool, false)
  }))
}
