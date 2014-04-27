class CreateCompanySystems < ActiveRecord::Migration
  def change
    create_table :company_systems do |t|
      t.references :company
      t.references :system
      t.integer "final_score"
      t.timestamps
    end
  end
end
