terraform {
  backend "s3" {
    bucket   = "homelab-tfstate"
    key      = "proxmox/terraform.tfstate"
    region   = "auto"
    endpoint = "https://591e670eabda143fd9842b5aa4debbe5.r2.cloudflarestorage.com"

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
  }
}
