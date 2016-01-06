node 'pc1', 'pc2' {
#  include exp::stages

  class { 'exp::param':
    param1 => 'woo!',
    param2 => 'hoo!',
   }

}

