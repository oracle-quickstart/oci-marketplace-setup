# oci-quickstart-template

The [Oracle Cloud Infrastructure (OCI) Quick Start](https://github.com/oracle-quickstart?q=oci-quickstart) is a collection of examples that allow Oracle Cloud Infrastructure users to get a quick start deploying advanced infrastructure on OCI.

The oci-quickstart-template repository contains the template that can be used for accelerating the construction of quickstarts that runs from local Terraform CLI, [OCI Resource Manager](https://docs.cloud.oracle.com/en-us/iaas/Content/ResourceManager/Concepts/resourcemanager.htm) and [OCI Cloud Shell](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/cloudshellintro.htm).

Simple is a sample quickstart terraform template that deploys a virtual machine on a Virtual Cloud Network.
Simple can be customized to subscribe and launch Marketplace images, Platform images or Custom images.

This repo is under active development.  Building open source software is a community effort.  We're excited to engage with the community building this.

## Resource Manager Deployment

This Quick Start uses [OCI Resource Manager](https://docs.cloud.oracle.com/iaas/Content/ResourceManager/Concepts/resourcemanager.htm) to make deployment easy, sign up for an [OCI account](https://cloud.oracle.com/en_US/tryit) if you don't have one, and just click the button below:

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?region=home&zipUrl=https://github.com/oracle-quickstart/oci-marketplace-setup/archive/main.zip)

After logging into the console you'll be taken through the same steps described
in the [Deploy](#deploy) section below.


Note, if you use this template to create another repo you'll need to change the link for the button to point at your repo.



### Deploy

1. [Login](https://console.us-ashburn-1.oraclecloud.com/resourcemanager/stacks/create) to Oracle Cloud Infrastructure to import the stack
    > `Home > Solutions & Platform > Resource Manager > Stacks > Create Stack`

2. Upload the `orm.zip` and provide a name and description for the stack
![Create Stack](./images/create_orm_stack.png)

3. Configure the Stack. The UI will present the variables to the user dynamically, based on their selections. These are the configuration options:

> Compute Configuration

|          VARIABLE          |           DESCRIPTION                                                 |
|----------------------------|-----------------------------------------------------------------------|
|COMPUTE COMPARTMENT         | Compartment for Compute resources, including Marketplace subscription |
|INSTANCE NAME               | Compute instance name|
|DNS HOSTNAME LABEL          | DNS Hostname|
|COMPUTE SHAPE               | Compatible Compute shape|
|FLEX SHAPE OCPUS            | Number of OCPUs, only available for VM.Standard.E3.Flex compute shape|
|AVAILABILITY DOMAIN         | Availability Domain|
|PUBLIC SSH KEY STRING       | RSA PUBLIC SSH key string used for sign in to the OS|

> Virtual Cloud Network

|          VARIABLE          |           DESCRIPTION                                                 |
|----------------------------|-----------------------------------------------------------------------|
|NETWORK COMPARTMENT         | Compartment for all Virtual Cloud Network resources|
|NETWORK STRATEGY            | `Create New VCN and Subnet`: Create new network resources during apply. <br> `Use Existing VCN and Subnet`: Let user select pre-existent network resources.|
|CONFIGURATION STRATEGY      | `Use Recommended Configuration`: Use default configuration defined by the Terraform template. <br> `Customize Network Configuration`: Allow user to customize network configuration such as name, dns label, cidr block for VCN and Subnet.|

> Virtual Cloud Network - Customize Network Configuration

|          VARIABLE          |           DESCRIPTION                                                 |
|----------------------------|-----------------------------------------------------------------------|
|NAME                        | VCN Display Name|
|DNS LABEL                   | VCN DNS LABEL|
|CIDR BLOCK                  | The CIDR of the new Virtual Cloud Network (VCN). If you plan to peer this VCN with another VCN, the VCNs must not have overlapping CIDRs.|

> Simple Subnet (visible only when `Customize Network Configuration` is selected)

|          VARIABLE          |           DESCRIPTION                                                 |
|----------------------------|-----------------------------------------------------------------------|
|SUBNET TYPE                 | `Public Subnet` or `Private Subnet`|
|NAME                        | Subnet Display Name|
|DNS LABEL                   | Subnet DNS LABEL|
|CIDR BLOCK                  | The CIDR of the Subnet. Should not overlap with any other subnet CIDRs|
|NETWORK SECURITY GROUP CONFIGURATION| `Use Recommended Configuration`: Use default configuration defined by the Terraform template. <br> `Customize Network Security Group`: Allow user to customize some basic network security group settings.|

> Network Security Group (visible only when `Customize Network Security Group` is selected)

|          VARIABLE          |           DESCRIPTION                                                 |
|----------------------------|-----------------------------------------------------------------------|
|NAME                        | NSG Display Name|
|ALLOWED INGRESS TRAFFIC (CIDR BLOCK)| WHITELISTED CIDR BLOCK for ingress traffic|
|SSH PORT NUMBER             | Default SSH PORT for ingress traffic|
|HTTP PORT NUMBER            | Default HTTP PORT for ingress traffic|
|HTTPS PORT NUMBER           | Default HTTPS PORT for ingress traffic|

> Additional Configuration Options

|          VARIABLE          |           DESCRIPTION                                                 |
|----------------------------|-----------------------------------------------------------------------|
|TAG KEY NAME                | Free-form tag key name|
|TAG VALUE                   | Free-form tag value|

4. Click Next and Review the configuration.
5. Click Create button to confirm and create your ORM Stack.
6. On Stack Details page, you can now run `Terraform` commands to manage your infrastructure. You typically start with a plan then run apply to create and make changes to the infrastructure. More details below:

|      TERRAFORM ACTIONS     |           DESCRIPTION                                                 |
|----------------------------|-----------------------------------------------------------------------|
|Plan                        | `terraform plan` is used to create an execution plan. This command is a convenient way to check the execution plan prior to make any changes to the infrastructure resources.|
|Apply                       | `terraform apply` is used to apply the changes required to reach the desired state of the configuration described by the template.|
|Destroy                     | `terraform destroy` is used to destroy the Terraform-managed infrastructure.|

