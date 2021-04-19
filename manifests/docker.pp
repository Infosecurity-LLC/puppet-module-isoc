# Class: isoc::docker
#
#
class isoc::docker {
	# resources
	include docker
  if defined( "firewall") {

	firewallchain { 'DOCKER:filter:IPv4':
      purge  => false,
    }
    firewallchain { 'DOCKER:nat:IPv4':
      purge  => false,
    }
  }
}