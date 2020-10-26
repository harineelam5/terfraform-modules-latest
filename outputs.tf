output "vpc_id" {
    value = module.vpc.vpc_id
}

output "subnet_id" {
    value = module.public_subnets.*.subnet_id
}

output "igw_id" {
    value = module.igw.*.igw_id
}

# output "nat_id" {
#     value = module.nat.*.nat_id
# }

# output "eip_id" {
#   value = module.nat.*.eip_id
# }