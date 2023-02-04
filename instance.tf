
resource "aws_instance" "app_server" {
    ami           = "ami-08d70e59c07c61a3a"
    count = 3
    instance_type = "t2.micro"
    security_groups = ["${aws_security_group.web-server.name}"]
    key_name = "key-instance"
    tags = {
        Name = "instance-${count.index}"
    }
}

resource "aws_key_pair" "name" {
    key_name = "key-instance"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQIr81LDqB4X2hch+Tmev5+xK1H426yjqxtsKoSoDKq2WJ1kuNWL4DL1LQVWuzMPXdyFkwmc0SI9jqpfC3rk0bu9LKVuJy+/MqYl4lq7aHvq1eiuhiKdNt6eOvJYVT4w4RNnIKgFVA2qh4LKiMY4MQx+nXN26KbB9QKJbQT+fHrIHNdR9txZyulLEPhGc2PFTa2CZU4lhvOL2UAi9oRqPqe3B0wGtqe4pJTfmguNj6Ikh08sthcBqsuqhp8D4jtWJVW6GOJh5rAOQNKjZkZ8eKyZS2+U5RaiGWcgH/JQgeHD1buKod24hc+8rYvv5HIX/od/Y3HKb98nASBPHdUPPxI3eJXff/tyEjmhaY0GfFB2CeJYc0ChsC45kpqh9xmD4fmlkTcLXSdsguSuoThvFy+LO4hReUvFNmr4FrUTsIC2FhArmkW3qvSIJjxMmf6kcGzvNluiaryFu5+Jjf2G4DPg8N4bR2vjMCwLBxK0hlJmChZJA+lfVBzitqevvUiWk= tbello@tbello-Laptop"
}
