require 'yaml'

Facter.add(:last_run_summary) do
  setcode do
    lrs = YAML.load_file('/opt/puppetlabs/puppet/cache/state/last_run_summary.yaml')
    if lrs["events"]["total"] == 0 && lrs["events"]["failure"] == 0 && lrs["events"]["success"] == 0
    puts "Puppet never ran"
    last_run_summary = 0
    else
    puts "Puppet ran; so doing full run"
    last_run_summary = 1
    end
 end
end
