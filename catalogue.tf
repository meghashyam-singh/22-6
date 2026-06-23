resource "aws_instance" "catalogue" {
    ami = data.aws_ami.ami_id.id
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.medium"
    subnet_id = split(",", data.aws_ssm_parameter.private_subnet_id.value)[0]
    vpc_security_group_ids = [ data.aws_ssm_parameter.catalogue_sg_id.value ]
    tags = {
        Name = "${local.common_name}_catalogue"
    }

    connection {
    host = self.private_ip
    type = "ssh"
    user = "ec2-user"
    private_key = file("C:/Users/megha/Downloads/17")
    }

    provisioner "file" {
      source = "catalogue_bootstrap.sh"
      destination = "/home/ec2-user/catalogue_bootstrap.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /home/ec2-user/catalogue_bootstrap.sh",
            "sudo /home/ec2-user/catalogue_bootstrap.sh"
        ]
    }
}


************  STILL THERE TO LEARN. THIS IS 70% ONLY 30% REMAINING. FOCUS ************