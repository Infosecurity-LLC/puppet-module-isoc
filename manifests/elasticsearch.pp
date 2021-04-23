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
    $grafana_alerts_server=lookup('grafana_alerts_server', String, 'deep', '')
    $grafana_alerts_prop=lookup('grafana_alerts_prop', Hash, 'deep', {})
    $grafana_role_alerts = {
        elasticsearch => {
          template => 'elasticsearch',
          }
    }
    if $grafana_alerts_server {
      @@isoc::grafana_role_alerts{"${fqdn}_grafana_es_alerts":
          services => $grafana_role_alerts,
          role=> $::role,
          organization=> $::organization,
          prop => $grafana_alerts_prop,
          grafana_alerts_server => $grafana_alerts_server,
      }
    }
  }
}
