# catalogue ingress rule. 
resource "aws_security_group_rule" "catalogue_ingress_rule" {
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
    source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}

#user ingress rule.
resource "aws_security_group_rule" "user_ingress_rule" {
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = data.aws_ssm_parameter.user_sg_id.value
    source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}

#cart ingress rule.
resource "aws_security_group_rule" "cart_ingress_rule" {
    type = "ingress" 
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = data.aws_ssm_parameter.cart_sg_id.value
    source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}

#shipping ingress rule.
resource "aws_security_group_rule" "shipping_ingress_rule" {
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
    source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}

#payment ingress rule.
resource "aws_security_group_rule" "payment_ingress_rule" {
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = data.aws_ssm_parameter.payment_sg_id.value
    source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}

#frontend ingress rule.
resource "aws_security_group_rule" "frontend_ingress_rule" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
    source_security_group_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
}

#frontend_alb ingress rule
resource "aws_security_group_rule" "frontend_alb_ingress_rule" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_group_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
    cidr_blocks = ["0.0.0.0/0"] 

}

#backend_alb ingress rule
resource "aws_security_group_rule" "backend_alb_ingress_rule" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
    source_security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
}