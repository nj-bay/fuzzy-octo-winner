class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :case_number
      t.integer :type_id
      t.integer :sub_type_id
      t.string :sub_type_detail
      t.integer :case_ids
      t.string :serial_numbers
      t.timestamp :created_date

    end
  end
end
