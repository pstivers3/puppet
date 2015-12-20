node 'pm', 'pc1', 'pc2' {
  file { '/tmp/hello':
    content => "Hello, world\n",
  } 
}
