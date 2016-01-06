node 'base' {
  include puppet
  include admin::ntp
}

node 'FLAM06' {
  include puppet
}

node 'pc1' inherits 'base' {

}

node 'pc2' inherits 'base' {
  include memcached
}

