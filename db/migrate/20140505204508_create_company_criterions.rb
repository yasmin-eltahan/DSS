class CreateCompanyCriterions < ActiveRecord::Migration
  def change
    create_table :company_criterions do |t|
    	t.references :company
    	t.references :criterion
    	t.references :system
    	t.integer "weight"
    	t.integer "value"
      t.timestamps
    end
  end
end
