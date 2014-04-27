class CreateCompanySubcriteria < ActiveRecord::Migration
  def change
    create_table :company_subcriteria do |t|
      t.references :subcriteria
      t.references :company
      t.timestamps
    end
  end
end
