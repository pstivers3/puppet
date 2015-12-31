# first run on the command line:
# $ export FACTER_moonphase='waxing crescent'

node 'pc1', 'pc2' {

  notify { "${::users} users logged in": }
  notify { "The moon is $::moonphase": }
  
}

