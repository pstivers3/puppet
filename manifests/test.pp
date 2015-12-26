if $::operatingsystem == 'Ubuntu' {
  notify { 'Running on Ubuntu': }
} else {
  notify { 'Not running on Ubuntu':}
}
