class test::param ($param1, $param2, $param3 = 'boo!') {
  # param3 => 'boo!", # doesn't work 
  notify { "param1 is ${param1}": }
  notify { "param2 is ${param2}": }
  notify { "param3 is ${param3}": }
}

