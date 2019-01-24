class v_ssh(
  String $package_name,
  String $service_name,
  String $ensure,
  String $service_ensure,
  Boolean $service_enable,
  Boolean $permit_root_login = false,
  Integer $port              = 22,
) {
  
  class { '::v_ssh::service': }
  class { '::v_ssh::config': }
  class { '::v_ssh::install': }

  Class['::v_ssh::install']
  -> Class['::v_ssh::config']
  ~> Class['::v_ssh::service']
  -> Class['v_ssh']
}
