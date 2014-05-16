class AddConsultantToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :consultant, :string
  end
end
