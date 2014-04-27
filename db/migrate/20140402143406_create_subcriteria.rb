class CreateSubcriteria < ActiveRecord::Migration
  def change
    create_table :subcriteria do |t|
    	t.string "name"
    	t.string "description"
    	t.references :criteria

      t.timestamps
    end
  end
end
