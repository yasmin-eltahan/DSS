class CreateCompanySubcriterions < ActiveRecord::Migration
  def change
    create_table :company_subcriterions do |t|
    	t.references :subcriterion
      t.references :company
      t.timestamps
    end
  end
end
