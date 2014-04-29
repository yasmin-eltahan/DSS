class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
    	t.string "name"
    	t.string "programming_language"
    	t.string "description"
    	t.integer "no_of_employees"
      t.references :vendor
      t.timestamps
    end
  end
end
