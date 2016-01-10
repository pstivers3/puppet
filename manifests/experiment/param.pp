class param_test ($param1, $param2) {
  notify { "param1 is ${param1}": }
  notify { "param2 is ${param2}": }
}

node 'pc1', 'pc2' {

  class { 'param_test':
    param1 => 'woo!',
    param2 => 'hoo!',
  }

}
