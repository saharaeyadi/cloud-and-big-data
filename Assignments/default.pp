node 'appserver' {
  class { 'nodejs': } -> package { 'serve': ensure => present, provider => 'npm', }
}
node 'web' {
  package{'nginx':
    ensure => "installed",
  }
}
node 'dbserver' {
  class { '::mysql::server':
    root_password           => 'sahar'
  }
}
node /^tst\d+$/ {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }
}
