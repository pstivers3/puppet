node 'pc1', 'pc2' {

  $magic_word = hiera('magic_word')
  notify { $magic_word: }

  $node_greeting = hiera('node_greeting')
  notify { $node_greeting: }

  $is_virtual_greeting = hiera('is_virtual_greeting')
  notify { $is_virtual_greeting: }
  
}

