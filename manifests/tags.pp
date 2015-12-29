node 'bitfield_server' {
}

node 'pc1', 'pc2' inherits 'bitfield_server' {
  include admin::ntp

  if tagged('pc2') {
    notify { 'This is pc2. This will succeed.': }
  }

  if tagged('bitfield_server') {
    notify { 'This is bitfield_server. This will also succeed.': }
  }

  if tagged('admin::ntp') {
    notify { 'This node is running NTP': }
  }

  if tagged('admin') {
    notify { 'This node includes at least one class from the admin module': }
  }
  
  tag('big-server') # set a tag
  if tagged('big-server') {
    notify { 'Big server detected. Adding extra workload': }
  }
}

