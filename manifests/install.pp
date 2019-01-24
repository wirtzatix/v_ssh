class v_ssh::install(
  String $package_name = $::v_ssh::package_name,
  String $ensure       = $::v_ssh::ensure,
) {
  package { 'ssh-package':
    ensure => $ensure,
    name   => $package_name,
  }
}
