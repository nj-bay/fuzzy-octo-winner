class CreateDeviceRecords < ActiveRecord::Migration
  def change
    create_table :device_records do |t|
      t.string :serial_number
      t.timestamp :provisioned_at
      t.timestamp :activated_at
      t.timestamp :disassociated_at
      t.integer :merchant_id
      
      t.timestamps null: false
    end
  end
end
