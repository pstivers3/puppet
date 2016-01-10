node 'flam06', 'pc1', 'pc2' {

 $repo_path = $::hostname? {
  FLAM06 => '/Users/paul.stivers/repos',
  default => '/home/ubuntu/',
 }

 # $message = generate('bin/echo', "$repo_path") # fails. Sees "$repo_path" as a path and not text?
 $message = generate('/bin/cat', "$repo_path/puppet/README.md")
 notify { "$message": }
}
