# @summary Class for include postgresql resources
#
# This class create defined types from module postgresql, all values are hashes
#
# @example Basic usage
#   include isoc::postgresql
#
# @param [Hash] server_config_entrys
#      Create resources `postgresql::server::config_entry`
# @param [Hash] server_dbs
#      Create resources `postgresql::server::db`
# @param [Hash] server_databases
#      Create resources `postgresql::server::database`
# @param [Hash] server_database_grants
#      Create resources `postgresql::server::database_grant`
# @param [Hash] server_extensions
#      Create resources `postgresql::server::extension`
# @param [Hash] server_grants
#      Create resources `postgresql::server::grant`
# @param [Hash] server_grant_roles
#      Create resources `postgresql::server::grant_role`
# @param [Hash] server_pg_hba_rules
#      Create resources `postgresql::server::pg_hba_rule`
# @param [Hash] server_pg_ident_rules
#      Create resources `postgresql::server::pg_ident_rule`
# @param [Hash] server_recoverys
#      Create resources `postgresql::server::recovery`
# @param [Hash] server_roles
#      Create resources `postgresql::server::role`
# @param [Hash] server_schemas
#      Create resources `postgresql::server::schema`
# @param [Hash] server_table_grants
#      Create resources `postgresql::server::table_grants`
# @param [Hash] server_tablespaces
#      Create resources `postgresql::server::tablespace`
# @param [Hash] validate_db_connections
#      Create resources `postgresql::validate_db_connection`
#
class isoc::postgresql (
  $server_config_entrys    = undef,
  $server_dbs              = undef,
  $server_databases        = undef,
  $server_database_grants  = undef,
  $server_extensions       = undef,
  $server_grants           = undef,
  $server_grant_roles      = undef,
  $server_pg_hba_rules     = undef,
  $server_pg_ident_rules   = undef,
  $server_recoverys        = undef,
  $server_roles            = undef,
  $server_schemas          = undef,
  $server_table_grants     = undef,
  $server_tablespaces      = undef,
  $validate_db_connections = undef,
  ) {

if $server_config_entrys {
    create_resources('postgresql::server::config_entry', $server_config_entrys)
  }

if $server_dbs {
    create_resources('postgresql::server::db', $server_dbs)
  }
if $server_databases {
    create_resources('postgresql::server::database', $server_databases)
  }
if $server_database_grants {
    create_resources('postgresql::server::database_grant', $server_database_grants)
  }
if $server_extensions {
    create_resources('postgresql::server::extension', $server_extensions)
  }    
if $server_grants {
    create_resources('postgresql::server::grant', $server_grants)
  }
if $server_grant_roles {
    create_resources('postgresql::server::grant_role', $server_grant_roles)
  }
if $server_pg_hba_rules {
    create_resources('postgresql::server::pg_hba_rule', $server_pg_hba_rules)
  }
if $server_pg_ident_rules {
    create_resources('postgresql::server::pg_ident_rule', $server_pg_ident_rules)
  }
if $server_recoverys {
    create_resources('postgresql::server::recovery', $server_recoverys)
  }
if $server_roles {
    create_resources('postgresql::server::role', $server_roles)
  }
if $server_schemas {
    create_resources('postgresql::server::schema', $server_schemas)
  }
if $server_table_grants {
    create_resources('postgresql::server::table_grants', $server_table_grants)
  }
if $server_tablespaces {
    create_resources('postgresql::server::tablespace', $server_tablespaces)
  }
if $validate_db_connections {
    create_resources('postgresql::validate_db_connection', $validate_db_connections)
  }

}
