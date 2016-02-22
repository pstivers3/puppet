define apache::vhost(
  $docroot,
  $port,
  $priority,
  $ssl=true,
  $serveraliases = '',
  $template='apache/vhost.conf.erb',
){
 
#  include apache
 
  file {"/etc/apache2/sites-enabled/${priority}-${name}":
    content => template($template),
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
#    require => Class['apache::install'],
#    notify  => Class['apache::service'],
  }
}

apache::vhost { 'www.example.com ':
  port          => '80',
  docroot       => '/var/www/ www.example.com ',
  ssl           => false,
  priority      => '10',
  serveraliases => 'home.example.com ',
}
