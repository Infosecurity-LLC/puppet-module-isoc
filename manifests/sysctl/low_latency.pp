# @summary Class for fine tuning tcp stack in local network
#
# This class tune tcp stack using `sysctl`
#
# @example Basic usage
#      include isoc::sysctl::lowlatency
#
# @param net_ipv4_tcp_orphan_retries
#      Set parameter kernel `net.ipv4.tcp_orphan_retries`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_ipv4_tcp_syncookies
#      Set parameter kernel `net.ipv4.tcp_syncookies`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_ipv4_tcp_timestamps
#      Set parameter kernel `net.ipv4.tcp_timestamps`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_ipv4_tcp_no_metrics_save
#      Set parameter kernel `net.ipv4.tcp_no_metrics_save`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_ipv4_tcp_rfc1337
#      Set parameter kernel `net.ipv4.tcp_rfc1337`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_ipv4_tcp_low_latency
#      Set parameter kernel `net.ipv4.tcp_low_latency`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_ipv4_tcp_sack
#      Set parameter kernel `net.ipv4.tcp_sack`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_ipv4_tcp_tw_reuse
#      Set parameter kernel `net.ipv4.tcp_tw_reuse`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param tcp_buff
#      Set three parameter kernel `net.ipv4.tcp_mem`, `net.ipv4.tcp_rmem`, `net.ipv4.tcp_wmem`, if you set value as `undef`, puppet will not touch this parameters.
#
# @param net_ipv4_tcp_congestion_control
#      Set three parameter kernel `net.ipv4.tcp_congestion_control`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_ipv4_tcp_max_syn_backlog
#      Set three parameter kernel `net.ipv4.tcp_max_syn_backlog`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_ipv4_udp_mem
#      Set three parameter kernel `net.ipv4.udp_mem`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_ipv4_udp_rmem_min
#      Set three parameter kernel `net.ipv4.udp_rmem_min`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_ipv4_udp_wmem_min
#      Set three parameter kernel `net.ipv4.udp_wmem_min`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_core_rmem_default
#      Set three parameter kernel `net.core.rmem_default`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_core_wmem_default
#      Set three parameter kernel `net.core.wmem_default`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_core_rmem_max
#      Set three parameter kernel `net.core.rmem_max`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_core_wmem_max
#      Set three parameter kernel `net.core.wmem_max`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_core_somaxconn
#      Set three parameter kernel `net.core.somaxconn`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_core_netdev_max_backlog
#      Set three parameter kernel `net.core.netdev_max_backlog`, if you set value as `undef`, puppet will not touch this parameter.
#
# @param net_ipv4_tcp_fin_timeout
#      Set three parameter kernel `net.ipv4.tcp_fin_timeout`, if you set value as `undef`, puppet will not touch this parameter.
#
class isoc::sysctl::low_latency (
    Optional[String]  $net_ipv4_tcp_congestion_control  = 'htcp',
    Optional[Integer] $net_ipv4_tcp_fin_timeout         = 25,
    Optional[Integer] $net_ipv4_tcp_low_latency         = 1,
    Optional[Integer] $net_ipv4_tcp_max_syn_backlog     = 2048,
    Optional[Integer] $net_ipv4_tcp_no_metrics_save     = 1,
    Optional[Integer] $net_ipv4_tcp_orphan_retries      = 0,
    Optional[Integer] $net_ipv4_tcp_rfc1337             = 1,
    Optional[Integer] $net_ipv4_tcp_sack                = 1,
    Optional[Integer] $net_ipv4_tcp_syncookies          = 0,
    Optional[Integer] $net_ipv4_tcp_timestamps          = 0,
    Optional[Integer] $net_ipv4_tcp_tw_reuse            = 1,
    Optional[String]  $tcp_buff                         = '4096  8388608  16777216',
    Optional[String]  $net_ipv4_udp_mem                 = '1024000  8738000  167772160',
    Optional[Integer] $net_ipv4_udp_rmem_min            = 32768,
    Optional[Integer] $net_ipv4_udp_wmem_min            = 32768,
    Optional[Integer] $net_core_rmem_default            = 268435456,
    Optional[Integer] $net_core_wmem_default            = 268435456,
    Optional[Integer] $net_core_rmem_max                = 536870912,
    Optional[Integer] $net_core_wmem_max                = 536870912,
    Optional[Integer] $net_core_somaxconn               = 32768,
    Optional[Integer] $net_core_netdev_max_backlog      = 32000,
    ){
    if $net_ipv4_tcp_orphan_retries {
      sysctl{ 'net.ipv4.tcp_orphan_retries':
        value => "$net_ipv4_tcp_orphan_retries"}
    }

    if $net_ipv4_tcp_syncookies {
      sysctl{ 'net.ipv4.tcp_syncookies':
        value => "$net_ipv4_tcp_syncookies"}
    }

    if $net_ipv4_tcp_timestamps {
      sysctl{ 'net.ipv4.tcp_timestamps':
        value => "$net_ipv4_tcp_timestamps"}
    }

    if $net_ipv4_tcp_no_metrics_save {
      sysctl{ 'net.ipv4.tcp_no_metrics_save':
        value => "$net_ipv4_tcp_no_metrics_save"}
    }

    if $net_ipv4_tcp_rfc1337 {
      sysctl{ 'net.ipv4.tcp_rfc1337':
        value => "$net_ipv4_tcp_rfc1337"}
    }

    if $net_ipv4_tcp_low_latency {
      sysctl{ 'net.ipv4.tcp_low_latency':
        value => "$net_ipv4_tcp_low_latency"}
    }

    if $net_ipv4_tcp_sack {
      sysctl{ 'net.ipv4.tcp_sack':
        value => "$net_ipv4_tcp_sack"}
    }

    if $net_ipv4_tcp_tw_reuse {
      sysctl{ 'net.ipv4.tcp_tw_reuse':
        value => "$net_ipv4_tcp_tw_reuse"}
    }

    $sysctl_value_tcp_buff = ["net.ipv4.tcp_mem", "net.ipv4.tcp_rmem", "net.ipv4.tcp_wmem"]

    if $tcp_buff {
    sysctl{ $sysctl_value_tcp_buff:
      value => $tcp_buff}
    }

    if $net_ipv4_tcp_congestion_control {
      sysctl{ 'net.ipv4.tcp_congestion_control':
        value => $net_ipv4_tcp_congestion_control}
    }

    if $net_ipv4_tcp_max_syn_backlog {
      sysctl{ 'net.ipv4.tcp_max_syn_backlog':
        value => "$net_ipv4_tcp_max_syn_backlog"}
    }

    if $net_ipv4_udp_mem {
      sysctl{ 'net.ipv4.udp_mem':
        value => $net_ipv4_udp_mem}
    }

    if $net_ipv4_udp_rmem_min {
      sysctl{ 'net.ipv4.udp_rmem_min':
        value => "$net_ipv4_udp_rmem_min"}
    }

    if $net_ipv4_udp_wmem_min {
      sysctl{ 'net.ipv4.udp_wmem_min':
        value => "$net_ipv4_udp_wmem_min"}
    }

    if $net_core_rmem_default {
      sysctl{ 'net.core.rmem_default':
        value => "$net_core_rmem_default"}
    }

    if $net_core_wmem_default {
      sysctl{ 'net.core.wmem_default':
        value => "$net_core_wmem_default"}
    }

    if $net_core_rmem_max {
      sysctl{ 'net.core.rmem_max':
        value => "$net_core_rmem_max"}
    }

    if $net_core_wmem_max {
      sysctl{ 'net.core.wmem_max':
        value => "$net_core_wmem_max"}
    }

    if $net_core_somaxconn {
      sysctl{ 'net.core.somaxconn':
        value => "$net_core_somaxconn"}
    }

    if $net_core_netdev_max_backlog {
      sysctl{ 'net.core.netdev_max_backlog':
        value => "$net_core_netdev_max_backlog"}
    }

    if $net_ipv4_tcp_fin_timeout {
      sysctl{ 'net.ipv4.tcp_fin_timeout':
        value => "$net_ipv4_tcp_fin_timeout"}
    }

}