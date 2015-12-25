SSH = 'ssh -A -l ubuntu'
REPO = "git@github.com:pstivers/puppet.git"

# apply puppet code on remote client pc1
# example: rake CLIENT=pc1 apply
desc "Run puppet on ENV['CLIENT']"
task :apply do
  client = ENV['CLIENT']
  sh "git push"
  sh "#{SSH} #{client} pull-updates"
end

