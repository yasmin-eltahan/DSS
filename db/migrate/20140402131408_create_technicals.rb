class CreateTechnicals < ActiveRecord::Migration
  def change
    create_table :technicals do |t|
    	t.string "name"
    	t.string "description"
      t.timestamps
    end
  end
end
