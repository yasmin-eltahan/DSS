class CreateCompanyCriteria < ActiveRecord::Migration
  def change
    create_table :company_criteria do |t|
    	t.references :company
    	t.references :criteria
    	t.integer "weight"
      t.timestamps
    end
  end
end
