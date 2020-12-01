# @summary Class for include firewall rules for services
#
# It class share firewall rules and create it in needed nodes.
#
# @example
#   include isoc::firewall
# @param rules_export
#      Can node export resources `firewall` to other nodes
# @param rules_collect
#      Can node collect and create firewall rules in iptables from other nodes
class isoc::firewall (
Boolean	$rules_export  = true,
Boolean $rules_collect = true,
	){
	if $rules_export {
		$rules_lookup_options = {
				'name'  => 'firewalls_export',
				'value_type' => Hash,
				'default_value' => {},
				'merge' => {
					  'strategy'          => 'deep',
					  'knockout_prefix'   => '--'}}
		$rules = lookup($rules_lookup_options)
		$rule_default = {
			'source' => ["${ipaddress}"]
		}
		create_resources('@@firewall', $rules, $rule_default)
	}
	if $rules_collect {
		Firewall <<| tag == "role_${role}" and tag == "org_${organization}" |>>
	}
}
