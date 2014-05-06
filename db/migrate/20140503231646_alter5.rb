class Alter5 < ActiveRecord::Migration
  def up
  	remove_column :company_requirements , :val
  	add_column :company_requirements , :value , :string
  end

  def down
  end
end
