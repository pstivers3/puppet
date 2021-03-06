# Manage NTP
class ntp {
  package { 'ntp':
    ensure => installed,
  }

  service { 'ntp':
    ensure  => running,
    require => Package['ntp'],
  }

  file { '/etc/ntpd.conf':
    source  => 'puppet:///modules/admin/ntp.conf',
    notify  => Service['ntp'],
    require => Package['ntp'],

    # Another way to do it
    # Package['ntp'] -> File['/etc/ntpd.conf'] ~> Service['ntp'], # throws a syntax error 
    # File['/etc/ntp.conf'] ~> Package['ntp'] -> Service['ntp'], # swap position of File and Package as a test. Same syntax error.
  }

}

node 'pc1', 'pc2' {
  include ntp
}
