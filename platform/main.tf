module "management_group"{
    source="../modules/management_groups"
    sub1=var.sub1
    sub2=var.sub2
}

# module "resource_group"{
#     source = "../../modules/rg"
#     name="rg_alz"
#     location = var.location
# }

# module "log_analytics"{
#     source = "../modules/log_analytics"
#     name = "rg-platform-monitoring"
#     location = var.location
#     resource_group_name = module.resource_group.rg_name
#     tags=var.commontags
    
# }

# module "policy"{
#     source="../modules/policy"
#     management_group_id = module.management_group.corpid
# }