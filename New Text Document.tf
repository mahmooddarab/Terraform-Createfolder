terraform {
  required_providers {
    vsphere = {
      version = "2.2.0"
    }
  }
}
provider "vsphere" {
    user = "administrator@vsphere.local"
    password = "PASSWORD"
    vsphere_server = "IP_VCENTER"
    allow_unverified_ssl = true
}

data "vsphere_datacenter" "Datacenter" {
  name = "Datacenter"

}

resource "vsphere_folder" "parrent" {
  path = "VM_NAME"
  type = "vm"
  datacenter_id = data.vsphere_datacenter.Datacenter.id
}