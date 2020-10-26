module "vpc" {
    source = "./modules/network/vpc"
    vpc = var.vpc
    environment = var.environment  
}


module "public_subnets" {
    source = "./modules/network/subnets/public-subnets"
    vpc_id = module.vpc.vpc_id[1]
    public_subnets = var.public_subnets
    environment = var.environment    
}


module "igw" {
    igw = var.igw
    source = "./modules/network/igw"
    vpc_id = module.vpc.vpc_id[1]
}
