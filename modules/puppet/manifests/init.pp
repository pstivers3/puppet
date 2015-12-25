# pull updates from Git and apply puppet code
# run a script in cron to do same

class puppet {

  file { '/usr/local/bin/papply':
    source => 'puppet:///modules/puppet/papply.sh',
    mode   => '0755',
  }

  file { '/usr/local/bin/pull-updates':
    source => 'puppet:///modules/puppet/pull-updates.sh',
    mode   => '0755',
  }

  cron { 'run-puppet':
#    ensure  => 'present',
    ensure  => 'absent',
    user    => 'ubuntu',
    command => '/usr/local/bin/pull-updates',
    minute  => '*/10',
    hour    => '*',
  }

}
