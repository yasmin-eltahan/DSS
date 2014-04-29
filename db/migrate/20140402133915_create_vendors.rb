class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string "name"
      t.string "address"
      t.string "website"
      t.integer "revenue"
      t.boolean "public" , :default => false
      t.integer "no_of_employees"
      t.string "headquarters"
      t.timestamps
    end
  end
end
