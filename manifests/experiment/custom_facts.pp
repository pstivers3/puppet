# first run on the command line:
# $ export FACTER_moonphase='waxing crescent'

node 'pc1' {

  notify { "${::users} users logged in": }
  notify { "The moon is $::moonphase": }
  
}

node 'pc2' {

  notify { "answer1 is $::answer1": }
  notify { "answer2 is $::answer2": }
  notify { "${::users} users logged in": }
  notify { "The moon is $::moonphase": }
  
}
