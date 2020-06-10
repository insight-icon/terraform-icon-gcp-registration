variable "static_content_provider" {
  description = "The provider "
  type        = string
  default     = ""
}

variable "bucket_name" {
  description = "The bucket name for static content - blank for team name"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Additional tags to include"
  type        = map(string)
  default     = {}
}

########
# Label
########
variable "network_name" {
  description = "mainnet or testnet - Don't mess this up!!!!!!!!"
  type        = string
  default     = "mainnet"
}

variable "labels" {
  description = "Map of labels"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Name of the resources"
  type        = string
  default     = ""
}

##############
# Registration
##############
variable "skip_registration" {
  description = "Bool to skip registration"
  type        = bool
  default     = false
}

variable "details_endpoint" {
  description = "Endpoint you have details and logos"
  type        = string
  default     = ""
}

variable "organization_name" {
  description = "Any string - your team name"
  type        = string
  default     = ""
}
variable "organization_country" {
  description = "This needs to be three letter country code per https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3"
  type        = string
  default     = ""
}
variable "organization_email" {
  description = "Needs to be real email"
  type        = string
  default     = ""
}
variable "organization_city" {
  description = "No qualifiers"
  type        = string
  default     = ""
}
variable "organization_website" {
  description = "Needs to begin in https / http - can be google..."
  type        = string
  default     = ""
}

variable "logo_256" {
  description = "Path to png logo"
  type        = string
  default     = ""
}
variable "logo_1024" {
  description = "Path to png logo"
  type        = string
  default     = ""
}
variable "logo_svg" {
  description = "Path to svg logo"
  type        = string
  default     = ""
}
variable "steemit" {
  description = "Link to social media account - https://..."
  type        = string
  default     = ""
}
variable "twitter" {
  description = "Link to social media account - https://..."
  type        = string
  default     = ""
}
variable "youtube" {
  description = "Link to social media account - https://..."
  type        = string
  default     = ""
}
variable "facebook" {
  description = "Link to social media account - https://..."
  type        = string
  default     = ""
}
variable "github" {
  description = "Link to social media account - https://..."
  type        = string
  default     = ""
}
variable "reddit" {
  description = "Link to social media account - https://..."
  type        = string
  default     = ""
}
variable "keybase" {
  description = "Link to social media account - https://..."
  type        = string
  default     = ""
}
variable "telegram" {
  description = "Link to social media account - https://..."
  type        = string
  default     = ""
}
variable "wechat" {
  description = "Link to social media account - https://..."
  type        = string
  default     = ""
}
variable "server_type" {
  description = "Link to social media account - https://..."
  type        = string
  default     = "cloud"
}

variable "public_ip" {
  description = "Optional if you are registering an IP from a different network - only creates details content, leave blank and insert cloud provdier to create ip"
  type        = string
  default     = null
}

//------------------

variable "keystore_path" {
  description = "the path to your keystore"
  type        = string
}

variable "keystore_password" {
  description = "The keystore password"
  type        = string
}

