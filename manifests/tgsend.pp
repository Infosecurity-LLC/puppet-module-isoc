# @summary Class for create python script for send notifications to telegram channels.
#
# This class create script for send notifications to telegram channels
#
# @example Main usage
#   include isoc::tgsend
#
# @example Include as parametrized class
#   class {isoc::tgsend:
#     ensure => present,
#     bot_id => 'mybotid',
#     chat_id => <my-chat-id>,
#   }
#
# @param ensure
#      Create or delete file tg-send
# @param bot_id
#      ID bot in telegram
# @param chat_id
#      Chat ID in telegram for send notifications
# @param critical_chat_id
#      Chat ID for critical notifications
# @param proxy
#      URL proxy for connect to telegram servers
#
class isoc::tgsend (
    Enum['present', 'absent'] $ensure           = 'absent',
    String                    $bot_id           = '',
    Integer                   $chat_id          = undef,
    Optional[Integer]         $critical_chat_id = undef,
    Optional[String]          $proxy            = undef,
){
    if $ensure == 'present' {
        $_ensure = file
    } else {
        $_ensure = $ensure
    }
    file { '/usr/bin/tg-send':
      ensure  => $_ensure,
      mode    => '0755',
      content => template("isoc/tgsend/tg-send.erb"),
    }
}
