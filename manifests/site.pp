node 'base' {
  include puppet
  include admin::ntp
}

node 'FLAM06' {
  include puppet
}

node 'pm' inherits base {

}

node 'pc1' inherits 'base' {

}

node 'pc2' inherits 'base' {
  include memcached
  include hiera

}

