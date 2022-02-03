# Terraform in GCP

  This file from https://github.com/Powerberm/terraform allows you to create a project, make billing to the project, grant an owner role to the defined user by email, 
  put the project to the specified location, and enable compute engine apis together with several Google APIs.
  
## Run git clone command
- git clone https://github.com/Powerberm/terraform

## Edit variables in the Terraform file
- cd /terraform
- nano terraform-gcpproject-creation.tf
  - Edit variables according to your project name, project ID, folder ID, billing account, IAM email (If you edit in Cloud Shell on Google Cloud Console, you can click on "Open Editor" to easily correct the variables.)
- To save the edited file, press Ctrl+o, press Enter, and press Ctrl+x

## Command to run Terraform
- terraform init
- terraform plan
- terraform apply --auto-approve (If not include --auto-approve, it will prompt and you have to type "yes" to continue.
