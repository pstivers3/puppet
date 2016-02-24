#!/bin/sh

help_state=$1
file_pp=$1
# shift
if [ -n "$(echo $file_pp | egrep '.pp')" ]; then
  shift
fi

usage="usage: papply [manifest file name (site.pp is default)] [--noop] [--debug]"
example1="example1: papply" 
example2="example2: papply test_this.pp --noop --debug"

# process any command line options
while [ -n "$(echo $1 | egrep '^-')" ]; do
    case $1 in
        --noop ) 
            noop_option='--noop'
            ;;
        --debug ) 
            debug_option='--debug' 
            ;;
        * )
            echo
            echo "\"$1\" is not a valid option."
            echo "\n$usage\n$example1\n$example2\n" 
            exit 1
    esac
    shift
done

if [ "$help_state" = help ] || [ "$help_state" = -h ] || [ "$help_state" = --help ]; then
    echo "\n$usage\n$example1\n$example2\n"
    exit 0
elif [ -z "$(echo $file_pp | egrep '.pp')" ]; then
  echo "applying site.pp $noop_option $debug_option"
  sudo puppet apply /home/ubuntu/puppet/manifests/site.pp --modulepath=/home/ubuntu/puppet/modules/ --hiera_config=/home/ubuntu/puppet/hiera.yaml $noop_option $debug_option
else
  echo "applying $file_pp $noop_option $debug_option"
  sudo puppet apply $file_pp --modulepath=/home/ubuntu/puppet/modules/ --hiera_config=/home/ubuntu/puppet/hiera.yaml $noop_option $debug_option 
fi

exit 0

