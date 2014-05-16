class AlterCompanysystem < ActiveRecord::Migration
  def up
  	  	add_column :company_systems, :user_id, :integer
  end

  def down
  end
end
