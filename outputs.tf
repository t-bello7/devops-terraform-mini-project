# output "instance_id" {
#     description = "ID of the EC2 instance"
#     value = aws_instance.app_server.id
# }

# output "instance_public_id" {
#     description = "Public IP address of the EC2 instance"
#     value =  aws_instance.app_server.public_ip
# }

output "elb-dns-name" {
  value = aws_lb.publicalb.dns_name
}

output "webserver-ip-address" {
  value = join("", aws_instance.app_server[*].public_ip)
}

resource "local_file" "outputs" {
    content  =  <<-EOF
                ${aws_lb.publicalb.dns_name}
                ${join("\n", aws_instance.app_server[*].public_ip)}
                EOF
    filename = "outputs.txt"
}


resource "local_file" "ansible-hosts" {
    content  =  <<-EOF
                [vm]
                ${join("\n", aws_instance.app_server[*].public_ip)}
                EOF
    filename = "host-inventory"
}