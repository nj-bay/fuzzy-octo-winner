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


  desc "Calculate the time of each device, and get min, max, and average"
  task calculate_time: :environment do

	first = DeviceRecord.first 
	# byebug
	if first.disassociated_at == nil 
		duration = Time.now.to_i - first.provisioned_at.to_i
	else 
		duration = first.disassociated_at.to_i - first.provisioned_at.to_i
	end	

	min = duration
	max = duration
	sum = 0
	number = DeviceRecord.all.count

  	DeviceRecord.all.limit(100).each do |record|

  		if record.disassociated_at == nil 
			duration = Time.now.to_i - first.provisioned_at.to_i
		else 
			duration = first.disassociated_at.to_i - first.provisioned_at.to_i
		end	
		max = duration if duration > max and duration > 0 
		min = duration if duration < min and duration > 0 
		# sum = sum + duration
  	end

  	byebug
  	# ave = sum / number

  	puts "min length merchant have it is: #{Time.at(min)} "
  	puts "max length merchant have it is: #{Time.at(max)} "
  	# puts "ave length merchant have it is: #{ave.strftime("%H:%M:%S")} "
  end


end
