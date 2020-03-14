from azure.common.client_factory import get_client_from_json_dict
from azure.mgmt.compute import ComputeManagementClient
import argparse
import sys
import os

if __name__ == '__main__':
    # Retrieve tenant_id, client_id, and client_secret from Azure KeyVault
    print('Authenticating with the Azure Provider...')
    auth_dict = {
        "clientId": "89e8ca16-1090-49e0-a4c9-d8927b2835aa",
        "clientSecret": "2e10ee4d-3034-44d5-9a88-2e8df2a9d807",
        "subscriptionId": "3a2efedf-fc87-4c5e-b3f8-a089ad33a2e8",
        "tenantId": "0c4c6c9a-7ce2-4aa8-ab35-7a74ad4c80c3",
        "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
        "resourceManagerEndpointUrl": "https://management.azure.com/",
        "activeDirectoryGraphResourceId": "https://graph.windows.net/",
        "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
        "galleryEndpointUrl": "https://gallery.azure.com/",
        "managementEndpointUrl": "https://management.core.windows.net/"
    }
    
    client = get_client_from_json_dict(ComputeManagementClient, auth_dict)
    print('Done: ' + str(client) + " created!")
    
    args = argparse.ArgumentParser()
    args.add_argument('command', help="The command to execute (can be plan, apply)")
    run_args = args.parse_args()
    
    if (run_args.command == 'plan'):
        os.system('terraform init ./.travis-ci/terraform/')
        os.system('terraform plan -o ./.travis-ci/infrastructure/planfile')
    elif (run_args.command == 'apply'):
        os.system('terraform init ./.travis-ci/terraform/')
        os.system('terraform apply ./.travis-ci/infrastructure/planfile')
    else:
        print('Invalid terraform command... Must be one of "plan" or "Apply".')
        sys.exit(1)
    