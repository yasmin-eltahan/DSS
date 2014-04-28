class AlterVendor < ActiveRecord::Migration
  def up
  	add_column :vendors, :phone , :string
  end

  def down
  end
end
