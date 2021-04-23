# @summary Class for include nginx 
#
#
class isoc::nginx (
  $selinux_modules = {},
  $selinux_booleans = {},
  $selinux_fcontexts = {},
  $selinux_ports = {}
  ) {

  include nginx
  if $facts['os']['selinux']['enabled'] {
    if $selinux_modules {
      create_resources('selinux::module', $selinux_modules)
    }
    if $selinux_booleans {
      create_resources('selinux::boolean', $selinux_booleans)
    }
    if $selinux_fcontexts {
      create_resources('selinux::fcontext', $selinux_fcontexts)
    }
    if $selinux_ports {
      create_resources('selinux::port', $selinux_ports)
    }

}
