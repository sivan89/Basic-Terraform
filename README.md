# Basic-Terraform

All the examples available here
 
AWS 
FirstExample - Terraform Block / Provide Block - EC2 Instance Creation  
Manifest=vpm - Multiple provider 
Random-s3 - Creating S3 with randam provider
Resouce-Syntax - Resources Block Actions and Examples
EC2InstanceCreation - VPC , EC2 creation in AWS
CountIndex - Counting loop using count meta argument
foreach-list - for_each (lolist/loset) --> [()] meta argument
foreach-map - for_each (map) --> {} meta argument
lifestyle-prevent_destroy
lifestyle-create_before_destroy
lifestyle-ignore_changes
lifestyle-replace_triggered_by
InputVariable
InputVariableLIST
InputVariableSET
InputVariableTUPLE
InputVariableMAP
InputVariableOBJECT and LIST(OBJECT) both are in the same folder
VariableValidation_OutputBlock --> Variable validation, Output Blocks , Terraform Functions
LocalBlock
EC2InstanceCreation -- updated backend block with AWS S3

Azure 


devops_tools

Commands to Run 

terraform init --->  Initialize Terraform
terraform validate --->  Validate Terraform Configuration Files
terraform plan ---> Generate Terraform Plan
terraform apply -auto-approve ---> Create Resources
Verify the same ---> AWS GUI
terraform destroy -auto-approve ---> Destroy Terraform Resources
rm .terraform*  --->  Delete Terraform Files
rm terraform.tfstate*  --->  Delete Terraform Files
