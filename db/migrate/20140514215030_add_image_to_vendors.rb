class AddImageToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :image, :string
  end
end
