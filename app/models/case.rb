class Case < ActiveRecord::Base
	

	belongs_to :case_type, :foreign_key => "type_id"

	def get_device_type

		if self.serial_numbers != "-1" 
			# byebug
			dt = Device.find_by(serial_number: self.serial_numbers)
			if dt != nil
				return dt.device_type.device_type_number
			else 
				return "-1"
			end
		end

		return "-1"
	end

end
