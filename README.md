# oci-marketplace-setup

The [Oracle Cloud Infrastructure (OCI) Quick Start](https://github.com/oracle-quickstart?q=oci-quickstart) organization is a collection of examples that allow Oracle Cloud Infrastructure users to get a quick start deploying advanced infrastructure on OCI.

This oci-marketplace-setup repo contains a template to create Marketplace publisher policies and groups in [OCI Resource Manager](https://docs.cloud.oracle.com/en-us/iaas/Content/ResourceManager/Concepts/resourcemanager.htm). You can create a Stack (copy of this template) and run an Apply job (to create the resources) by clicking the button below and following the steps in the [Deploy](#deploy) section below.

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?region=home&zipUrl=https://github.com/oracle-quickstart/oci-marketplace-setup/archive/main.zip)


### Deploy

After clicking the deploy button above you will be presented with 3 screens using 'Next' to navigate:

1. Stack Information - Click "Accept Oracle terms", and can optionally change the name of the stack.
2. Variables - You can leave the defaults or uncheck any resources you do not wish to create.
3. Review - Click "Create" to automatically create the resources because "Run Apply" is checked.

After about 30 sec this will create the following resources in the root compartment and default domain:

- A service policy to allow Marketplace to read image and stack artifacts to be published.
- A user group and policy to grant admin permissions to Marketplace resources.
- A user group and policy to grant admin permissions to Private Offers for publishers/sellers.
- A user group and policy to grant admin permissions to Private Offers for buyers (used by publishers for testing).
