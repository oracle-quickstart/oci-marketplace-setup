###
# iam.tf outputs
###

output "marketplace_service_policy" {
  value = oci_identity_policy.marketplace_service_policy.*.id
}
