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
Import -- import from AWS using import command and to be continued in future there platform(here AWS)
DataSourceBlock -- data source to access information about an existing resource
Functions -- commands
Modules -- Local Modules
Expressions_functions -- Terraform Functions  
Expressions_functions_if -- terraform Dynamic Expressions (if and for )
DynamicBlocks -- dynamically construct repeatable nested blocks  (if and for using(LIST,MAP) fir dynamic using blocks )
FileProvisioners -- File Provisioner is used to copy files -- both ssh and winrm type of connections
LocalEXECProvisioners -- local_exec provisioner invokes a local executable after a resource is created
RemoteEXECProvisioners -- remote_exec provisioner invokes a script on a remote resource after it is created
NULLResources -- If you need to run provisioners that aren't directly associated with a specific resource


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
