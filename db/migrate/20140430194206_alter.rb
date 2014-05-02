class Alter < ActiveRecord::Migration
  def up
  	add_column :company_requirements, :max , :boolean
  	add_column :system_requirements, :max , :boolean
  end

  def down
  end
end
