node 'pc1', 'pc2' {
  $message = hiera('magic_word')
  notify { $message: }
}

