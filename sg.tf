resource "aws_security_group" "roboshop_sg" {
    count = length(var.sg_names)

    name = "${local.common_name}_${var.sg_names[count.index]}_sg_id"
    description = "roboshop project security groups"

    vpc_id = aws_vpc.roboshop_vpc.id

    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${local.common_name}_${var.sg_names[count.index]}_sg_id"
    }

}