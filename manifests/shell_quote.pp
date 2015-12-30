node 'pc1', 'pc2' {

  $dir1 = 'test dir1'
  $dir2  = 'test dir2'
  $argstring = shellquote($dir1, $dir2)
  $command = "/bin/mv ${argstring}"
  notify { $command: }

}

