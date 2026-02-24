module "management_group"{
    source="../../alz_terraform_alz/modules/management_groups"
    sub1=var.sub1
    sub2=var.sub2
}

module "resource_group"{
    source = "../../alz_terraform_alz/modules/rg"
    name="rg_alz"
    location = var.location
}

module "log_analytics"{
    source = "../modules/log_analytics"
    name = "rg-platform-monitoring"
    location = var.location
    resource_group_name = module.resource_group.rg_name
    tags=var.commontags
    
}

module "policy"{
    source="../modules/policy"
    management_group_id = module.management_group.corpid
}


# az ad sp create-for-rbac  --name "github-terraform-sp" --role "Owner" --scopes /subscriptions/11c5480c-3b05-40bc-bc49-099960a2baf8 --sdk-auth

# {
#   "clientId": "cbd6141f-d595-4ff2-a3a1-6d2b9b9a05bb",
#   "clientSecret": "-z_8Q~xVQKIclsQAw3WFeJy.~XUjAZe8LaieQcGa",
#   "subscriptionId": "11c5480c-3b05-40bc-bc49-099960a2baf8",
#   "tenantId": "cd548ec1-2048-47ac-aef6-9538bf41f974",
#   "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
#   "resourceManagerEndpointUrl": "https://management.azure.com/",
#   "activeDirectoryGraphResourceId": "https://graph.windows.net/",
#   "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
#   "galleryEndpointUrl": "https://gallery.azure.com/",
#   "managementEndpointUrl": "https://management.core.windows.net/"
# }