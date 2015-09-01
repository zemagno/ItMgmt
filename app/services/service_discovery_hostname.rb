class ServiceDiscoveryHostname

def go
	inv = InventarioSw.all
	inv.each do |inv|

		puts "tentanto #{inv.hostname}.BRQ.COM"
		ping = `ping -c 1 -W 1 #{inv.hostname}.BRQ.COM`
		ping =~ /.*\((\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\).*/
		ip = $1
		if ! ip.nil?
			i = InventarioHostname.find_or_create_by_hostname(inv.hostname)
			i.ip = ip
			i.save!
		end
	end
end	
end