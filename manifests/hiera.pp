node 'pm', 'pc1', 'pc2' {

  ## test eyaml
  $my_secret = hiera('my_secret')
  notify { "==> \$my_secret: $my_secret": } 
 
  if $my_secret == 'mysecretstuff_edited' {
    notify { "==> eyaml works!": }
  } elsif $my_secret == '' {
    notify { "==> \$my_secret is empty": }
  } 
  ## end test eyaml

  $magic_word = hiera('magic_word')
  notify { "==> \$magic_word: $magic_word": }
  
  $node_greeting = hiera('node_greeting')
  notify { "==> \$node_greeting: $node_greeting": }

  $is_virtual_greeting = hiera('is_virtual_greeting')
  notify { "==> \$is_virtual_greeting: $is_virtual_greeting": }

}

