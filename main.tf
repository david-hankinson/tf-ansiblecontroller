module "ansible-controller" {
    source = "../../modules/services/ansible-controller"

    cluster_name = "ansible-controller-asg"
    min_size = 1
    max_size = var.max_size
    instance_type = "t2.micro"
}