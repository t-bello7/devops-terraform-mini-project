variable "instances_names" {
  description = "Value of the Name tag for the EC2 instance"
  type = set(string)
  default = ["hello-intance"]
}