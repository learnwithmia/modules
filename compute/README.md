# up to 19.10 only
        az vm image list-skus --location australiaeast --publisher Canonical --offer UbuntuServer --output table

# 2024-04-03 this lists 18.04 to 23.04
        az vm image list-skus --location australiaeast --publisher Canonical --offer "ubuntu" --output table
