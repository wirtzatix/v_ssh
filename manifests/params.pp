class v_ssh::params {
  $permit_root_login = false
  $port              = 22

  case $facts['os']['family'] {
    'Debian', 'Ubuntu': {
      $package_name = 'openssh-server'
      $service_name = 'ssh'
    }
    /^RedHat|CentOS/: {
      $package_name = 'openssh-server'
      $service_name = 'sshd'
    }
    default: {
      fail("${facts['operatingsystem']} is not supported!")
    }
  }
}
