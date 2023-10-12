
variable "user_uuid" {
  type        = string
  description = "the UUID of the user"

    validation {
        condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$", var.user_uuid))
        error_message = "The user_uuid value must be a valid AMI id, starting with \"ami-\"."
    }
}


