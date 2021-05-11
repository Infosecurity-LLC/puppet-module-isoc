class isoc::fw_pre {
  include ipset
### Manage ipset
  $virtual_ipsets = lookup('virtual_ipsets',Hash,'deep',{})
  if $virtual_ipsets {
    create_resources('@ipset::set', $virtual_ipsets)
  }
  $realize_ipsets = lookup('realize_ipsets',Array[String],'unique', [])
  if $realize_ipsets {
    realize(Ipset[$realize_ipsets])
  }
  $ipsets = lookup('ipsets',Hash,'deep',{})
  if $ipsets {
    create_resources('ipset::set', $ipsets)
  }
### Manage firewall
  if $ipaddress6 {
    class { 'firewall' : ensure_v6 => 'running'}
  } else {
    class { 'firewall' : ensure_v6 => 'stopped'}
  }

  Firewall {
    require => undef,
  }
$ignore = [
        '--comment "[^"](?i:ignore)[^"]"',
        '--comment ".*(?i:ignore).*"' ,
        '.*(?i)docker.*',
        '.*(?i:br-).*', 
        '.*(172\.([1][6-9]{1}|[2][0-9]|[3][0-1])\.[\d]{1,3}\.[\d]{1,3}).*',
        '.*(KUBE).*',
        '.*f2b-.*'
        ]
$firewallchain = [ 'INPUT:filter:IPv4',
       'FORWARD:filter:IPv4',
       'OUTPUT:filter:IPv4',
       'PREROUTING:mangle:IPv4',
       'INPUT:mangle:IPv4',
       'FORWARD:mangle:IPv4',
       'OUTPUT:mangle:IPv4',
       'POSTROUTING:mangle:IPv4',
       'PREROUTING:nat:IPv4',
       'INPUT:nat:IPv4',
       'OUTPUT:nat:IPv4',
       'POSTROUTING:nat:IPv4']
    firewallchain { $firewallchain:
      purge => true,
      ignore => $ignore,
    }

    firewall { '000 drop type13 icmp': # mitigate vulnerable    CVE-1999-0524
      proto  => 'icmp',
      icmp   => 'timestamp-request',
      action => 'drop',
    }
     firewall { '001 accept all icmp':
       proto  => 'icmp',
       action => 'accept',
     }
     firewall { '002 accept all to lo interface':
       proto   => 'all',
       iniface => 'lo',
       action  => 'accept',
     }
     firewall { '003 reject local traffic not on loopback interface':
       iniface     => '! lo',
       proto       => 'all',
       destination => '127.0.0.1/8',
       action      => 'reject',
     }
     firewall { '004 accept related established rules':
       proto  => 'all',
       state  => ['RELATED', 'ESTABLISHED'],
       action => 'accept',
     }
}