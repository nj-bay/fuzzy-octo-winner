class CreateDeviceTypes < ActiveRecord::Migration
  def change
    create_table :device_types do |t|
      t.string :device_type_number

      t.timestamps null: false
    end
  end
end
