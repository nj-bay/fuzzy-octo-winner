# require 'csv'

require 'smarter_csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Merchant.destroy_all
# # csv_text = File.read(Rails.root.join('db', 'data', 'merchants.csv'))
# csv = SmarterCSV.process(Rails.root.join('db', 'data', 'merchants.csv'), {:col_sep => "\t"} )

# csv.each do |row|
	
# 	# {:id=>145985, 
# 	# 	:merchant_plan_name=>"Classic Bundle", 
# 	# 	:is_qsr=>1, 
# 	# 	:is_demo=>0, 
# 	# 	:mcc_code=>5814, 
# 	# 	:merchant_type=>"Fast Food Restaurants", 
# 	# 	:clover_category=>"Restaurant", 
# 	# 	:created_date=>"2015-07-01 00:06:56"}

#   t = Merchant.new
#   t.merchant_id = row[:id]
#   t.merchant_plan_name = row[:merchant_plan_name]
#   t.is_qsr = row[:is_qsr]
#   t.is_demo = row[:is_demo]
#   t.mcc_code = row[:mcc_code]
#   t.clover_category = row[:clover_category]
#   t.created_at = row[:created_date]

#   # search if the merchant_type is exisited 
#   mt = MerchantType.find_or_create_by(type_name: row[:merchant_type])
#   t.merchant_type_id = mt.id
#   # t.merchant_type 
#   t.save
#   # puts "#{t.street}, #{t.city} saved"
# end

# puts "There are now #{Merchant.count} rows in the  table"
# puts "There are now #{MerchantType.count} rows in the  table"


# csv_device = SmarterCSV.process(Rails.root.join('db', 'data', 'devices.csv'), {:col_sep => "\t"} )

# csv_device.each do |row|
	
#   # byebug 

# # {:id=>496513, 
# # 	:device_event=>"PROVISIONED", 
# # 	:serial_number=>"C010UC41351058", 
# # 	:device_type_id=>5, 
# # 	:merchant_id=>145985, 
# # 	:timestamp=>"2015-07-03 06:58:51"}

#   t = Device.new

#   t.device_id = row[:id]
#   t.device_event = row[:device_event]
#   t.merchant_id = row[:merchant_id]
#   t.serial_number = row[:serial_number]
#   t.timestamp = row[:timestamp]

#   # search if the merchant_type is exisited 
#   dt = DeviceType.find_or_create_by(device_type_number: row[:device_type_id])
#   t.device_type_id = dt.id
#   # t.merchant_type 
#   t.save

#   puts "#{t.device_id} #{t.serial_number} saved"
# end

# puts "There are now #{Device.count} rows in the  table"
# puts "There are now #{DeviceType.count} rows in the  table"


csv_cases = SmarterCSV.process(Rails.root.join('db', 'data', 'cases_test.csv'), {:col_sep => "\t"} )

csv_cases.each do |row|
	
  # byebug 

# {:id=>496513, 
# 	:device_event=>"PROVISIONED", 
# 	:serial_number=>"C010UC41351058", 
# 	:device_type_id=>5, 
# 	:merchant_id=>145985, 
# 	:timestamp=>"2015-07-03 06:58:51"}

  t = Case.new

  t.device_id = row[:id]
  t.device_event = row[:device_event]
  t.merchant_id = row[:merchant_id]
  t.serial_number = row[:serial_number]
  t.timestamp = row[:timestamp]

  # search if the merchant_type is exisited 
  dt = CaseType.find_or_create_by(device_type_number: row[:device_type_id])
  t.device_type_id = dt.id
  # t.merchant_type 
  t.save

  puts "#{t.device_id} #{t.serial_number} saved"
end

puts "There are now #{Device.count} rows in the  table"
puts "There are now #{DeviceType.count} rows in the  table"







