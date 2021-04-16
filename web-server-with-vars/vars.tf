# Input variable: google project ID
variable "GOOGLE_PROJECT_ID" {
  description = "The Google Project ID where you want to run this terraform"
#  default     = "cc-dev-sandbox-20200619"
}

# Input variable: vm name
variable "VM_NAME" {
  description = "The Name of VM that has to be created"
  default     = "test-utkarsh-code-pipes"
}
