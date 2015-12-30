node 'base' {
  include puppet
  include admin::ntp
}

node 'pc1' inherits 'base' {
  include admin::stages
}

node 'pc2' inherits 'base' {
  include memcached
}

