class CreateCriterions < ActiveRecord::Migration
  def change
    create_table :criterions do |t|
    	t.string "name"
    	t.string "description"
      t.timestamps
    end
  end
end
