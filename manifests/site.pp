node 'pc1' {
  include puppet
}

node 'pc2' {
#  include puppet
  include memcached
}
