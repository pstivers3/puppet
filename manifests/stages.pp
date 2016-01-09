# doesn't work
# puppet apply stages.pp compiles but doesn't return the notifys

class stages {
  stage { 'first': before => Stage['main'] }
  stage { 'last': require => Stage['main'] }

  class me_first {
    notify { 'This will be done first': }
  }

  class me_last {
    notify { 'This will be done last': }
  }

  class { 'me_first':
    stage => 'first',
  }
 
  class { 'me_last':
    stage => 'last',
  }

}

include stages
