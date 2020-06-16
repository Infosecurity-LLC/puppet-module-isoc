# @summary Main class to include other classes
#
# This base class for include other profiles, classes and create resources
#
# @example Main usage
#   include isoc
# or use hiera to include this module to tou envinronment
#   classes:
#     - isoc
#
#   isoc::use_telegraf: true
#
# @param [Boolean] use_influxdb
#   Include influxdb to install time-series database
#   If you want to configure influxdb, you may include to hiera
#
# @example Configure influxdb udp listener
#   influxdb::udp_config:
#     default:
#       enabled: true
#       bind-address: ':8089'
#       database: 'metrics'
#       retention-policy: ''
#       batch-size: 5000
#       batch-pending: 10
#       batch-timeout: '1s'
#       read-buffer: 0
#
# @param [Boolean] use_telegraf
#   Include telegraf to send metrics to you monitoring system
#   If you want to add or change output for telegraf, you may include to hiera
#
# @example Add output to telegraf in hiera
#   telegraf::outputs:
#     socket_writer:
#       address: "udp4://localhost:8089"
#       data_format: "influx"
#
# @param [Boolean] use_airflow
#   Include airflow to manage company's workflow orchestration.
#   If you want to set some parameters for airflow, you may include them to hiera
#
class isoc (
Boolean    $use_influxdb = false,
Boolean    $use_telegraf = false,
Boolean    $use_airflow = false,
    ){
    if $use_influxdb {
        include influxdb
    }
    if $use_telegraf {
        include telegraf
    }
    if $use_airflow {
        include airflow
    }
}
