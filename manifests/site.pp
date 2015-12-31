node 'base' {
  include puppet
  include admin::ntp
}

node 'pc1' inherits 'base' {
  # include test::stages

  # class { 'test::param':
  #  param1 => 'woo!',
  #  param2 => 'hoo!',
  # }

}

node 'pc2' inherits 'base' {
  include memcached
}

