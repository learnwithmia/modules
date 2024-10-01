variable "policies" {
  type = list(object({
    name                        = string
    policy_definition_id        = string
    subscription_id             = string
    enforce                     = optional(bool, false)
  }))
}
