class Device < ActiveRecord::Base
	belongs_to :device_type
	belongs_to :merchant
end