class AlterCompany < ActiveRecord::Migration
  def up
  	add_column :companies , :phone , :string
  end

  def down
  end
end
