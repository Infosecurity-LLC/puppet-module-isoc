# Class: isoc::curator
# 
class isoc::curator (
  $actions = {},
  $cron = true,
  $cron_ensure = 'present',
  $cron_hour   = '1',
  $cron_minute = '0',
  $cron_user   = 'root'
  ){
  include python
  include curator
#  $curator_actions = lookup('curator_actions', Hash, 'deep', {})
  if $actions {
    create_resources('curator::action', $actions)
  }

  $kibana_plugins = lookup('isoc::curator::kibana_plugins', Hash, 'deep', {})
  if $kibana_plugins {
    create_resources('kibana_plugin', $kibana_plugins)
  }
  if $cron {
    cron { 'curator_sactions':
      ensure   => $cron_ensure,
      command  => '/usr/bin/curator /root/.curator/actions.yml',
      user     => $cron_user,
      hour     => $cron_hour,
      minute   => $cron_minute,
    }
  }

}