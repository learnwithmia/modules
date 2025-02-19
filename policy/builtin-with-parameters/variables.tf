variable "policies" {
  type = list(object({
    name                        = string
    policy_definition_id        = string
    # subscription_id             = string
    parameter_name              = string
    parameter_type              = string
    parameter_value             = string
    enforce                     = optional(bool, false)
  }))
}

variable "subscription_id" {
  type = string
}
