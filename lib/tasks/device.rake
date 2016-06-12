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

  desc "Check the number of cases to each type device"
  task check_device: :environment do



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
	sum = 0.0
	number = 0

  	DeviceRecord.all.each do |record|
  	

  		if record.disassociated_at == nil 
			duration = Time.now.to_i - record.provisioned_at.to_i
		else 
			duration = record.disassociated_at.to_i - record.provisioned_at.to_i
		end	

		if duration > 0 
			if duration > max
				max = duration
			else duration < min
				min = duration
			end

			sum = sum + duration / 3600
			number = number + 1
		end 

		puts "max #{max}"
		puts "min #{min}"
		puts "sum #{sum}"

  	end

  	ave = sum / number

  	puts "min length merchant have it is: #{ min / 3600} hours"
  	puts "max length merchant have it is: #{ max / 3600} hours"
  	puts "ave length merchant have it is: #{ ave } hours"
  	puts "Total Records merchant have it is: #{number} "
  end


end
