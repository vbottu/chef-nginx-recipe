hostname = node['hostname']
file '/etc/mtd' do
	content "Hostname is this : #{hostname}"
end
