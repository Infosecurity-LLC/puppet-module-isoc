# Class: isoc::elasticsearch
#
#
class isoc::elasticsearch (
  $templates      = undef,
  $plugins        = undef,
  $kibana_plugins = undef,
  $include_es     = false,
  ) {
  if $include_es {
    include java
    include elastic_stack::repo
    include elasticsearch
  }

  if $templates {
    create_resources('elasticsearch::template', $templates)
  }
  if $plugins {
    create_resources('elasticsearch::plugin', $plugins)
  }
  if $kibana_plugins {
    create_resources('kibana_plugin', $kibana_plugins)
  }
  if defined(Class['telegraf']) {
    telegraf::input { 'elasticsearch':
      plugin_type    => 'elasticsearch',
      options        => [{
            'servers' => ['http://localhost:9200',],
            'cluster_health' => true,
            'cluster_stats' => true,
        }],
    }
  }
}
