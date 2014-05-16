class Alters < ActiveRecord::Migration
  def up
  	add_column :users, :role, :string , :default=>"viewer"
  	add_column :companies, :show, :boolean , :default => false
  	add_column :companies, :confirm, :boolean , :default => false
  	# change_column :company_criterions , :value , :default => 0
  end

  def down
  end
end
