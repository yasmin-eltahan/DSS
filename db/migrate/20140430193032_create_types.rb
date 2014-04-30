class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
    	t.string "name"
    	t.boolean "technical"
    	t.string "description"
    	t.boolean "string"
      t.timestamps
    end
  end
end
