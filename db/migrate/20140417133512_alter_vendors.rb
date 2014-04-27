class AlterVendors < ActiveRecord::Migration
  def up
  	add_column :vendors , :description , :text
  end

  def down
  end
end
