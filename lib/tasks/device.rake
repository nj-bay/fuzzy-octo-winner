namespace :device do
  desc "Get the unique device and the useing information"
  task unique_device: :environment do

  	Device.select(:serial_number).distinct.each do |device|	
  		puts "#{device.serial_number}"

  		Device.where(serial_number: device.serial_number).order(:timestamp).each do |record|
  			if record.device_event == "PROVISIONED"
  				dr = DeviceRecord.new 
  				dr.serial_number = record.serial_number
  				dr.provisioned_at = record.timestamp
  				dr.merchant_id = record.merchant_id
  				dr.save!
  				puts "#{device.serial_number} is PROVISIONED"

  			elsif record.device_event == "ACTIVATED" 
  				dr = DeviceRecord.find_by(serial_number: record.serial_number)
  				dr.activated_at = record.timestamp
  				dr.save!
  				puts "#{device.serial_number} is ACTIVATED"

  			elsif record.device_event == "DISASSOCIATED"
  				dr = DeviceRecord.find_by(serial_number: record.serial_number)
  				dr.disassociated_at = record.timestamp
  				dr.merchant_id = nil 
  				dr.save!
  				puts "#{device.serial_number} is DISASSOCIATED"
  			end
  		end

  	end

  end

end
