class CreateSubcriterions < ActiveRecord::Migration
  def change
    create_table :subcriterions do |t|
    	t.string "name"
    	t.string "description"
    	t.references :criterion
      t.timestamps
    end
  end
end
