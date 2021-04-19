# Class: profile::linux
#
#
class profile::linux {
  class { ['profile::fw_pre', 'profile::fw_post']: }

  Firewall {
     before  => Class['profile::fw_post'],
     require => Class['profile::fw_pre'],
   }
### Manage firewall rules
  $firewalls = lookup('firewalls',Hash,'deep',{})
  if $firewalls {
    create_resources('firewall', $firewalls)
  }
  $ssh_port = lookup('ssh_port',Integer,'deep',22)
  if $ssh_port {
    firewall {'100 allow ssh access':
        dport => $ssh_port,
        proto => 'tcp',
        action => 'accept'
    }
  }
### Manage Groups
  $virtual_groups = lookup('virtual_groups',Hash,'deep',{})
  if $virtual_groups {
    create_resources('@group', $virtual_groups)
  }
  $realize_groups = lookup('realize_groups',Array[String],'unique', [])
  if $realize_groups {
    realize(Group[$realize_groups])
  }
  $groups = lookup('groups', Hash, 'deep', {})
  if $groups {
    create_resources('group', $groups)
  }
### Manage Users
  $virtual_accounts_users = lookup('virtual_accounts_users',Hash,'deep',{})
  $virtual_accounts_user_default = lookup('virtual_accounts_user_default',Hash,'deep',{})
  if $virtual_accounts_users {
    $virtual_accounts_uid_ignore = lookup('virtual_accounts_uid_ignore',Boolean,'deep',false)
    if $virtual_accounts_uid_ignore {
        if length($virtual_accounts_users)>0 {
            $virtual_accounts_users_s1=Hash($virtual_accounts_users.map |$k, $v| { [$k,delete($v, ['gid', 'uid'])]})
        } else {
            $virtual_accounts_users_s1=$virtual_accounts_users
        }
       create_resources('@accounts::user', $virtual_accounts_users_s1, $virtual_accounts_user_default)
    } else {
       create_resources('@accounts::user', $virtual_accounts_users, $virtual_accounts_user_default)
    }
  }

  $realize_accounts = lookup('realize_accounts',Array[String],'unique', [])
  if $realize_accounts {
    realize(Accounts::User[$realize_accounts])
  }
#### Add Custom fact role
  if $trusted['extensions']['pp_role'] {
    $trusted_fact_role = {'role' => {'value' => $trusted['extensions']['pp_role']}}
    create_resources('puppet::fact', $trusted_fact_role)
  }
### Manage YUM Repo
  $yumrepos = lookup('yumrepos',Hash,'deep',{})
  if $yumrepos and $facts['os']['family'] == 'RedHat' {
    $yumrepo_default = lookup('yumrepo_default',Hash,'deep',{})
    create_resources('yumrepo', $yumrepos, $yumrepo_default)
  }
  ### Manage Dehydrated certs
  $dehydrated_certificates = lookup('dehydrated_certificates', Hash, deep, {})
    if $dehydrated_certificates {
    create_resources('dehydrated::certificate', $dehydrated_certificates)
  }
  if $facts['os']['selinux']['enabled'] {
    $selinux_modules = lookup('selinux_modules',Hash,'deep',{})
    if $selinux_modules {
      create_resources('selinux::module', $selinux_modules)
    }
    $selinux_booleans = lookup('selinux_booleans',Hash,'deep',{})
    if $selinux_booleans {
      create_resources('selinux::boolean', $selinux_booleans)
    }
    $selinux_fcontexts = lookup('selinux_fcontexts',Hash,'deep',{})
    if $selinux_fcontexts {
      create_resources('selinux::fcontext', $selinux_fcontexts)
    }
    $selinux_ports = lookup('selinux_ports',Hash,'deep',{})
    if $selinux_ports {
      create_resources('selinux::port', $selinux_ports)
    }
    $selinux_permissives = lookup('selinux_permissives',Hash,'deep',{})
    if $selinux_permissives {
      create_resources('selinux::permissive', $selinux_permissives)
    }
    # Специальное описание порта для ssh. Необходимо для всех, поэтому здесь.
    if $ssh_port > 0 or $ssh_port < 65536 {
      selinux::port { ssh_port:
        seltype => 'ssh_port_t',
        protocol => 'tcp',
        port =>  $ssh_port,
      }
    }

  }

}