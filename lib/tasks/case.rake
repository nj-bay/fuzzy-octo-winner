require 'smarter_csv'

namespace :case do
  desc "Get the case information from the files"
  task init_case: :environment do

  	csv_cases = SmarterCSV.process(Rails.root.join('db', 'data', 'cases.csv'), {:col_sep => "\t"} )
  	root = CaseType.find_or_create_by(name: 'root')

	csv_cases.each do |row|
# {:case_number=>11675205, 
# 	:type=>"New Merchant Set-Up", 
# 	:request_reason_subtype=>"Activation Code", 
# 	:reason_subtype_detail=>-1, 
# 	:id=>145985, 
# 	:serial_numbers=>-1, 
# 	:created_date=>"2015-07-13 19:54:46"}

	  t = Case.new

	  t.case_number = row[:case_number]
	  t.sub_type_detail = row[:reason_subtype_detail]
	  t.case_ids = row[:id]
	  t.serial_numbers = row[:serial_numbers]
	  t.created_date = row[:created_date]

	  # search if the merchant_type is exisited 
	  # byebug
	  
	  type = root.children.find_or_create_by(name: row[:type])	  
	  subtype = type.children.find_or_create_by(name: row[:request_reason_subtype])

	  t.type_id = type.id
	  t.sub_type_id = subtype.id

	  # t.merchant_type 
	  t.save

	  puts "#{t.case_number} saved"
	end

	puts "There are now #{Case.count} rows in the  table"
	puts "There are now #{root.children.count} rows in the  table"

  end

end
