class Merchant < ActiveRecord::Base

	belongs_to :merchant_type
	has_many :devices

end
