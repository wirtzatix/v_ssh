function v_ssh::data {
  $base_params = {
    'v_ssh::ensure'         => 'present',
    'v_ssh::service_enable' => true,
    'v_ssh::service_ensure' => 'running',
  }

  case $facts['os']['family'] {
    'Debian': {
      $os_params = {
        'v_ssh::package_name' => 'openssh-server',
        'v_ssh::service_name' => 'ssh',
      }
    }
    'RedHat': {
      $os_params = {
        'v_ssh::package_name' => 'openssh-server',
        'v_ssh::service_name' => 'sshd',
      }
    }
    default: {
      fail("${facts['operatingsystem']} is not supported!")
    }
  }

  $base_params + $os_params
}
