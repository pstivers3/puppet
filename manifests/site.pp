class base { 
# class { 'base': 
  include puppet
  include admin::ntp
}

node 'FLAM06' {
  include puppet
}

node 'pm' {
  include base 
}

node 'pc1' {
  include base
}

node 'pc2' {
  # include Class['base']
  include base
  include memcached
  # include hiera # couldn't find
}

