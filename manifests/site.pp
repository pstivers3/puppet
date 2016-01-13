class base { 
# class { 'base': 
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
  include base
}

node 'pc2.cisops.vericity.net' {
  # include Class['base']
  include base
  include memcached
  # include hiera # couldn't find
}

