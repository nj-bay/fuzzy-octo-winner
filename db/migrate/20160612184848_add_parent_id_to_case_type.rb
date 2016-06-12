class AddParentIdToCaseType < ActiveRecord::Migration
  def change
  	add_column :case_types, :parent_id, :integer
  end
end
