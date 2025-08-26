#Variables declared in this file must be declared in the marketplace.yaml
#Provide a description to your variables.

############################
#  Hidden Variable Group   #
############################
variable "tenancy_ocid" {}

variable "region" {}

############################
#  Variable Group          #
############################

variable "create_service_policy" {}

variable "create_publisher_group_policy" {}

variable "create_offer_group_policy" {}

variable "create_buyer_group_policy" {}