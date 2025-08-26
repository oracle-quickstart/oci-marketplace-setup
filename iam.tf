provider "oci" {
  alias  = "home_region"
  region = lookup(data.oci_identity_regions.home-region.regions[0], "name")
}

resource "oci_identity_policy" "marketplace_service_policy" {
  provider       = oci.home_region
  name           = "marketplace_service_policy"
  description    = "Allows Marketplace service resource access"
  compartment_id = var.tenancy_ocid
  statements = [
    "ALLOW SERVICE marketplace to manage App-catalog-publisher-listing IN TENANCY",
    "ALLOW SERVICE marketplace to read tenant IN TENANCY",
    "ALLOW SERVICE marketplace to read compartments IN TENANCY",
    "ALLOW SERVICE marketplace to read instance-images IN TENANCY",
    "ALLOW SERVICE marketplace to inspect instances IN TENANCY",
    "ALLOW SERVICE marketplace to read orm-stacks IN TENANCY",
    "ALLOW SERVICE marketplace to read orm-jobs IN TENANCY"
  ]
  count = var.create_service_policy ? 1 : 0
}

# Listing publisher group and policy

resource "oci_identity_group" "marketplace_publisher_group" {
  compartment_id = var.tenancy_ocid
  description    = "Admin permissions for Marketplace resources"
  name           = "MarketplacePublishers"
  count          = var.create_publisher_group_policy ? 1 : 0
}

resource "oci_identity_policy" "marketplace_publishing_policy" {
  provider       = oci.home_region
  name           = "MarketplacePublisher"
  description    = "Admin permissions for Marketplace resources"
  compartment_id = var.tenancy_ocid
  statements = [
    "Allow group MarketplacePublishers to manage marketplace-publisher-family in tenancy"
  ]
  count = var.create_publisher_group_policy ? 1 : 0
}

# Offer seller/buyer groups and policies

resource "oci_identity_group" "offers_seller_group" {
  compartment_id = var.tenancy_ocid
  description    = "Admin permissions for Private Offer sellers"
  name           = "MarketplaceOfferAdmins"
  count          = var.create_offer_group_policy ? 1 : 0
}

resource "oci_identity_policy" "marketplace_private_offer" {
  provider       = oci.home_region
  name           = "MarketplacePrivateOffer"
  description    = "Admin permissions for Marketplace Private Offers"
  compartment_id = var.tenancy_ocid
  statements = [
    "Allow group OfferAdmins to {MARKETPLACE_PUBLISHER_INSPECT, MARKETPLACE_PUBLISHER_METADATA_INSPECT, MARKETPLACE_OFFER_SELLER_INSPECT, MARKETPLACE_OFFER_READ, MARKETPLACE_OFFER_DETAILS_READ, MARKETPLACE_OFFER_CREATE,  MARKETPLACE_OFFER_UPDATE, MARKETPLACE_OFFER_DELETE, MARKETPLACE_OFFER_SEND, MARKETPLACE_OFFER_WITHDRAW} in tenancy"
  ]
  count = var.create_offer_group_policy ? 1 : 0
}

resource "oci_identity_group" "offers_buyer_group" {
  compartment_id = var.tenancy_ocid
  description    = "Admin permissions for Private Offer buyers"
  name           = "MarketplaceOfferBuyers"
  count          = var.create_buyer_group_policy ? 1 : 0
}

resource "oci_identity_policy" "marketplace_private_offer_buyer" {
  provider       = oci.home_region
  name           = "MarketplacePrivateOfferBuyer"
  description    = "Admin permissions for Marketplace Private Offers"
  compartment_id = var.tenancy_ocid
  statements = [
    "Allow group PrivateOfferBuyer to {MARKETPLACE_OFFER_BUYER_INSPECT, MARKETPLACE_OFFER_READ, MARKETPLACE_OFFER_ACCEPT} in tenancy"
  ]
  count = var.create_buyer_group_policy ? 1 : 0
}