class CreateCompanyCriteria < ActiveRecord::Migration
  def change
    create_table :company_criteria do |t|
    	t.references :company
    	t.references :criteria
    	t.references :system
    	t.integer "weight"
    	t.integer "value"
      t.timestamps
    end
  end
end
