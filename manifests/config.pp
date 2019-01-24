class v_ssh::config(
  $permit_root_login = $::v_ssh::permit_root_login,
  $port              = $::v_ssh::port,
) {
  file { '/etc/ssh/sshd_config':
    ensure  => file,
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    content => template('v_ssh/sshd_config.erb'),
  }
}
