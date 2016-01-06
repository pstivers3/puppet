From Puppet 3 cookbook

  chap 2, arrays
	
    What does the colon at the end of input do, in for example...
		
      define lunchprint() {
        notify { "Lunch included ${name}": }
      }
      $lunch = ['egg', 'beans', 'chips']
      lunchprint { $lunch: }
		
    Mark the end of input? 
    parse error if remove the :
	
  chap 2, conditionals
	
    What does the :: do, in for example...
		
      if $::operatingsystem == 'Ubuntu' {
        …
      }
		
      Clearly $::<var name> refernces an internal variable. 
      Not sure exactly what the :: does. Name space? 
      Removing :: didn't have any effect.
		
  chap 3, definitions
	
    Is ${name} a special variable?
    Looks like the array is passed through the tmpfile "function" to ${name},
    though name isn't explicitly defined as an input variable. No tmpfile(name)
		
      define tmpfile() {
        file { "/tmp/${name}":
          content => "Hello, world\n",
        }
      }
			
      tmpfile { ['a', 'b', 'c']: }
	
    Changing the variable name from 'name' to 'ame' causes an error.
		
      ubuntu@pc1:~/puppet/manifests$ puppet apply test.pp 
      Error: Duplicate declaration: File[/tmp/] is already declared in file 
        /home/ubuntu/puppet/manifests/test.pp:4; cannot redeclare at 
        /home/ubuntu/puppet/manifests/test.pp:4 on node pc1.ec2.internal
		
  chap 3, dependencies
	
    Strategic/architectural question for discussion. Could puppet have
    dependencies buit in under the hood if the directory structure in code 
    included names that match the package names?
		
    How come the second way to define dependencies throws an error?
 
      file { '/etc/ntpd.conf':
        source  => 'puppet:///modules/admin/ntp.conf',
        notify  => Service['ntp'],
        require => Package['ntp'],
		
        # second way to do it
        # throws a syntax error
        Package['ntp'] -> File['/etc/ntp.conf'] ~> Service['ntp'],  
        # swap position of File and Package as a test. Same syntax error. 
        File['/etc/ntp.conf'] ~> Package['ntp'] -> Service['ntp'],
      }
		
        second way returns:
	
          Error: Syntax error at ','; expected '}' at 
            /home/ubuntu/puppet/modules/admin/manifests/ntp.pp:21 
            on node pc2.ec2.internal
      
        ok to swap possition of File and Package in dependency chain?
		
  chap 3 run stages
	
    Why doesn't this run?
		
      ubuntu@pc1:~/puppet/manifests$ puppet apply run_stages.pp 
      Error: Could not parse for environment production: 
        Syntax error at '.'; expected '}' at 
        /home/ubuntu/puppet/manifests/run_stages.pp:3 on node pc1.ec2.internal
		
    This doesn't return anything. Why not?
		
      ubuntu@pc1:~/puppet/manifests$ puppet apply stages.pp 
      Notice: Compiled catalog for pc1.ec2.internal in environment production in
        0.01 seconds
      Notice: Finished catalog run in 0.01 seconds
		
    This runs fine
		
      ubuntu@pc1:~/puppet/manifests$ cat site.pp 
      node 'pc1' {
        include puppet
        include admin::stages
      }
			
      node 'pc2' {
        include puppet
        include memcached
        include admin::ntp
      }
			
      ubuntu@pc1:~/puppet/manifests$ papply 
      ...
      Notice: This will be done first
      ...
      Notice: This will be done last
      ...

  chapter 3, parameterization
	
    What does this error mean? Why won't this run?
		
      ubuntu@pc1:~/puppet/manifests$ puppet apply param.pp 
      Error: Could not parse for environment production: Classes, definitions,
        and nodes may only appear at toplevel or inside other classes at 
        /home/ubuntu/puppet/manifests/param.pp:3 on node pc1.ec2.internal
			
Puppet code

	Why is inheritance depricated in puppet 4.0.0? What is the best practice that replaces it.
	
		paul@fla:~/repos/puppet/manifests$ git commit site.pp -m "add node FLAM06"
		Warning: Deprecation notice: Node inheritance is not supported in Puppet >= 4.0.0. See http://links.puppetlabs.com/puppet-node-inheritance-deprecation
		   (at unknown:10)
		
puppet versions and documentation

	What's the right version of heira docmuntation of OS Puppet? Hiera 1?
	
		Hiera 1: Overview
		This is the version of Hiera included in Puppet Enterprise 3.8. Open source Puppet users should see the latest version of the docs. 
		
		Hiera 3: Overview
		This version is used with PE 2015.x. PE 3.7 and 3.8 users should see the Hiera 1.x docs

puppet client

	Why does leaving out -t throw an error?
	-t is test
	-v is verbose
	
		root@pc1:~# sudo puppet agent -v
		Error: Could not run: Could not create PID file: /var/run/puppet/agent.pid
		
	Why don't I see Notifys?
	
		root@pc1:~# sudo puppet agent -t -v
		Info: Retrieving plugin
		Info: Caching catalog for pc1.ec2.internal
		Info: Applying configuration version '1451416090'
		Notice: Finished catalog run in 0.02 seconds
		
		Notifies are returned if I run...
		
			ubuntu@pc1:~/puppet/manifests$ sudo puppet apply /home/ubuntu/puppet/manifests/site.pp --modulepath=/home/ubuntu/puppet/modules/
			Notice: Compiled catalog for pc1.ec2.internal in environment production in 0.06 seconds
			Notice: This will be done first
			Notice: /Stage[first]/Admin::Stages::Me_first/Notify[This will be done first]/message: defined 'message' as 'This will be done first'
			Notice: This will be done last
			Notice: /Stage[last]/Admin::Stages::Me_last/Notify[This will be done last]/message: defined 'message' as 'This will be done last'
			Notice: Finished catalog run in 0.04 seconds

