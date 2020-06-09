# @summary Main class to include other classes
#
# A description of what this class does
#
# @example Main usage
#   include isoc
# or use hiera to include this module to tou envinronment
#   classes:
#     - isoc
#
#   isoc::use_telegraf: true
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
class isoc (
Boolean    $use_telegraf = false,
    ){

    if $use_telegraf {
        include telegraf

    }
}
