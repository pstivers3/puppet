node 'pc1' {
  include puppet
}

node 'pc2' {
  include puppet
  include memcached
  include admin::ntp

  if tagged('admin::ntp') {
    notify { 'This node is running NTP': }
  }

  if tagged('admin') {
    notify { 'This node includes at least one class from the admin module': }
  }

}
