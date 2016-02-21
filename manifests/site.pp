class base { 
  include puppet
  include admin::ntp
}

node 'FLAM06' {
  include puppet
}

node 'puppet' {
  include base 
}

node 'pc1.cisops.vericity.net' {
  include puppet
  class { 'admin::ntp':
    # package_status   => installed,
    service_status   => running,
    # service_status   => stopped,
  }
}

node 'pc2.cisops.vericity.net' {
  include base
  include memcached
}

