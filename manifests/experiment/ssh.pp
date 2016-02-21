class ssh::params {
  case $::osfamily {
  'Debian': { $sshd_package  = 'ssh' }
  'RedHat': { $sshd_package  = 'openssh-server' }
  default:  {fail("Login class does not work on osfamily: ${::osfamily}")}
  }
}
 
class ssh inherits ssh::params {
  package { $::ssh::params::sshd_package:
    ensure => purged,
  }
}
 
include ssh
