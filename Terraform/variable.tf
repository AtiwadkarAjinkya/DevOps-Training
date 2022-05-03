variable "ami_id" {
    default = "ami-abc"
  type        = string
  description = "AMI ID for EC2 Instances"
  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^ami-", var.ami_id))
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "instance_type" {
    default = "t3"

}
