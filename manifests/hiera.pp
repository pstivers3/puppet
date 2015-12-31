node 'FLAM06', 'pc1', 'pc2' {

  $message = hiera('magic_word')
  notify { $message: }

  $message2 = hiera('greeting')
  notify { $message2: }

}

