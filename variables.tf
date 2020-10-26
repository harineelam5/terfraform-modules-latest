variable "region" {
    type = string 
    default = ""
}

variable "environment" {
    type = string
    default = ""
}

variable "vpc" {
    type = list
    default =[] 
    }

variable "public_subnets" {
    type = list
    default = []
}

variable "igw" {
    type = list
    default = []
}

