subscription_id= <SUBSCRIPTION-ID>
tenant_id = <TENANT-ID>
client_id = <CLIENTID>
client_secret = <CLIENTSECRET>
location = "eastus"
tag = "dev"

#######
#Resource Group
resource_group_name = "myresourcegroup"


#################################
#Virtual Network

vnet_name = "dev.vnet"
vnet_address_space = ["10.0.0.0/16"]

#################################
#Subnet Network
vnet_subnets_cidr_blocks = {
    web-subnet ={
        name = "web-subnet"
        address_prefixes = ["10.0.0.0/24"]
    }

    backend-subnet ={
        name = "backend-subnet"
        address_prefixes = ["10.0.1.0/24"]
    }

    db-subnet ={
        name = "db-subnet"
        address_prefixes = ["10.0.2.0/24"]
    }
    
}

#####################
#Web-Instance Configuration

vm1_name = "web-instance"
vm1_admin_username = "admin"
vm1_admin_password = "admin123"
vm1_size = "Standard_F2"