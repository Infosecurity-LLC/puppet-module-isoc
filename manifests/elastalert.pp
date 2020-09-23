# @summary Class for install and configure elastalert
#
# This class install package elastalert-correlation, configure him and start service `elastalert`
#
# @example
#   include isoc::elastalert
# @param ensure
#      If ensure don't equal `present`, delete all resources for service
# @param [String] package_name
#      Name of package for install
# @param [String] package_ensure
#      Ensure package for install, may be 'latest', 'installed', '1.2.0' and etc.
# @param config_dir
#      Path for configuration directory
# @param bin_dir
#      Path to binary directory from package elastalert-correlation
# @param [String] config_file
#      Filename for configuration service elastalert. Required parameter
# @param [String] config_file_source
#      Source file with config elastalert. Use URI as for parameter source resource `file`. Required parameter
# @param service_manage
#      If true then manage service elastalert
# @param [String] service_name
#      Name for service would be manage
# @param service_ensure
#      Service `ensure` parameter
# @param [Boolean] service_enable
#      Service `enable` parameter
# @param service_subscribe
#      Service `subscribe` parameter
class isoc::elastalert (
    Enum['present', 'absent']   $ensure                         = 'present',
    String                      $package_name                   = 'elastalert-correlation',
    String                      $package_ensure                 = 'installed',
    Stdlib::Absolutepath        $config_dir                     = '/etc/elastalert',
    Stdlib::Absolutepath        $bin_dir                        = '/opt/elastalert',
    String                      $config_file                    = 'elastalert_config.yaml',
    String                      $config_file_source             = '',
    Boolean                     $service_manage                 = false,
    String                      $service_name                   = 'elastalert',
    Enum['stopped', 'false', 'running', 'true'] $service_ensure = 'running',
    Boolean                     $service_enable                 = true,
    Variant[ Array, String, Undef ] $service_subscribe          = File["${config_dir}/${config_file}"],
    ){
if $ensure == 'present' {
    package { $package_name:
        ensure => $package_ensure,
    }
    file { $config_dir:
        ensure  => directory,
        require => Package[$package_name],
    }
    file { "${config_dir}/${config_file}":
        ensure  => file,
        source  => $config_file_source,
        require => File[$config_dir]
    }
    if $service_manage {
        service { $service_name:
            enable      => $service_enable,
            ensure      => $service_ensure,
            subscribe   => $service_subscribe,
        }
    }
} else {
    if $service_manage {
        service { $service_name:
            enable      => false,
            ensure      => stopped,
        }
    }
    file { $config_dir:
        ensure => absent,
    }
    package { $package_name:
        ensure => absent,
    }
}

}
