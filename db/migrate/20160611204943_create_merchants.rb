class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      
      t.integer :merchant_id
      t.string :merchant_plan_name
      t.integer :is_qsr
      t.boolean :is_demo
      t.integer :mcc_code
      t.integer :merchant_type_id
      t.string :clover_category

      t.timestamps null: false
    end
  end
end
