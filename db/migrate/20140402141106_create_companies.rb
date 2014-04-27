class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
    	t.string "name"
    	t.string "address"
    	t.string "website"
    	t.string "headquarters"
    	t.string "size"
    	t.string "owner"
    	t.string "goals"
    	t.boolean "public"
    	t.integer "no_of_employees"
    	t.integer "no_of_braches"
    	t.integer "revenue"
      t.timestamps
    end
  end
end
