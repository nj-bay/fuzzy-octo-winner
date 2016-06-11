class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :device_id
      t.string :device_event
      t.string :serial_number
      t.integer :device_type_id
      t.integer :merchant_id
      t.datetime :timestamp
    end
  end
end
