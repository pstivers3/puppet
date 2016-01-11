#!/bin/sh

help_state=$1
file_pp=$1

usage="usage: papply [manifest file name (site.pp is default)]"
example1="example1: papply" 
example2="example2: papply test_this.pp"
 
if [ "$help_state" = help ] || [ "$help_state" = -h ] || [ "$help_state" = --help ]; then
    echo -e "\n$usage\n$example1\n$example2\n"
    exit 0
elif [ "$file_pp" = '' ]; then
  echo "applying site.pp"
  sudo puppet apply /home/ubuntu/paul-puppet/manifests/site.pp --modulepath=/home/ubuntu/paul-puppet/modules/ --hiera_config=/home/ubuntu/paul-puppet/hiera.yaml $*
else
  echo "applying $file_pp"
  sudo puppet apply $file_pp --modulepath=/home/ubuntu/paul-puppet/modules/ --hiera_config=/home/ubuntu/paul-puppet/hiera.yaml
fi

exit 0
