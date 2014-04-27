class CreateCompanyRequirements < ActiveRecord::Migration
  def change
    create_table :company_requirements do |t|
    t.references :company
    t.references :requirement
    t.string "value"
    t.timestamps
    end
  end
end
