class AlterCompany2 < ActiveRecord::Migration
  def up
  	remove_column :companies , :no_of_braches
  	add_column :companies , :no_of_branches, :integer
  end

  def down
  end
end
