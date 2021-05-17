# Class: isoc::keepalived
#
#
class isoc::keepalived (
  $global_router_id     = 'sc_balancer1',
  $script_path             = undef,
  $script_source           = undef,
  $script_template         = undef,
  $vrrp_instances          = undef,
  $vrrp_instance_default   = undef,
  $lvs_virtual_servers     = undef,
  $export_lvs_real_servers = undef,
#  $telegraf                = true,
  ) {

  $script_file_content = $script_template ? {
    ''      => undef,
    undef   => undef,
    default => template($script_template),
  }
  $script_file_source = $script_source ? {
    ''      => undef,
    undef   => undef,
    default => $script_source,
  }

#  $zabbix_agent_server = lookup('zabbix::agent::server',String,'first',undef)
  if $vrrp_instances or $lvs_virtual_servers {
    include keepalived
    class { 'keepalived::global_defs':
      router_id => $global_router_id,
    }
    if $facts['os']['selinux']['enabled'] and $facts['os']['family'] == 'RedHat' and $facts['os']['release']['major'] == '7' {
      selinux::boolean { 'keepalived_connect_any':
        ensure => 'on',
      }
    }

    firewall { '100 Accept vrrp protocol INPUT':
      proto       => 'vrrp',
      destination => '224.0.0.0/8',
      action      => 'accept',
    }
    firewall { '100 Accept vrrp protocol OUTPUT':
      chain       => 'OUTPUT',
      proto       => 'vrrp',
      destination => '224.0.0.0/8',
      action      => 'accept',
    }
    if ! defined(Package['ipvsadm']) {
      package { 'ipvsadm':
        ensure => installed,
      }
    }
    sysctl {'net.ipv4.ip_forward':
      value => '1',
    }
  if $script_path {
    file { $script_path:
      ensure  => file,
      source  => $script_file_source,
      content => $script_file_content,
      mode    => '0700',
    }
  }
  if defined(Class['telegraf']) {
    file_capability { '/usr/bin/telegraf':
        capability => 'cap_net_admin,cap_net_raw=eip',
        notify     => Service[telegraf],
      }
    telegraf::input { 'ipvs':
      plugin_type    => 'ipvs',
      options        => [{}],
    }
  }
  }

if $vrrp_instances {
  create_resources('keepalived::vrrp::instance', $vrrp_instances, $vrrp_instance_default)
  }
if $lvs_virtual_servers {
  create_resources('keepalived::lvs::virtual_server', $lvs_virtual_servers)
  }
if $export_lvs_real_servers {
  create_resources('@@keepalived::lvs::real_server', $export_lvs_real_servers)
  if !defined(Class['keepalived']) and defined(Class['telegraf']) {
    file { '/etc/telegraf/telegraf.d/ipvs.conf':
      ensure => absent,
      notify => Service['telegraf'],
    }
  }
}
}
