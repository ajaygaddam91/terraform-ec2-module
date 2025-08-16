variable "instance-type" {
  type        = string
  description = "This variable is for instance type"
}
variable "ami_id" {
  type        = string
  description = "This is for image id"
}

variable "availability-zone" {
  type        = string
  description = "this is for availability zone"
}

variable "tag" {
  type        = map(string)
  description = "This is for giving multiple tags"
}
variable "sg-description" {
  type        = string
  description = "SG-Description"
}
variable "sg-name" {
  type        = string
  description = "This is the sg-name"
}
variable "sg-inbound" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  description = "Secuiryt group inbound rules"

}