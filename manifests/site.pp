node 'pc1' {
  include puppet
  include admin::stages
}

node 'pc2' {
  include puppet
  include memcached
  include admin::ntp
}

