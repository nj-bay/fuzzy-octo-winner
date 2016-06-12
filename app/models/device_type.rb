class DeviceType < ActiveRecord::Base

	has_many :devices
	@@reports = Hash.new 

	def self.device_report
		
		DeviceType.all.each do |type|
			@@reports[type.device_type_number] = 0
		end

		@@reports["-1"] = 0 # undefined device

		Case.all.each do |c|
			puts "#{c.get_device_type} is saved"
			@@reports[c.get_device_type] = @@reports[c.get_device_type] + 1
		end

		puts @@reports

	end

end

# Inside of rails c
# DeviceType.device_report

# DeviceType.reports