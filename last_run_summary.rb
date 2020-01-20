#Puppet fact to see if puppet ran or not; you can set a variable instead of puts; 
#Use is for first run to do basic puppet (AD auth) to speed up provisioning


require 'yaml'

Facter.add(:last_run_summary) do
  setcode do
    lrs = YAML.load_file('/opt/puppetlabs/puppet/cache/state/last_run_summary.yaml')
    if lrs["events"]["total"] == 0 && lrs["events"]["failure"] == 0 && lrs["events"]["success"] == 0
    puts "Puppet never ran"
    else
    puts "Puppet ran; so doing full run"
    end
 end
end
