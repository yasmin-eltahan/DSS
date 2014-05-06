class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
    	t.string "name"
    	t.boolean "technical"
    	t.string "description"
      t.timestamps
    end
  end
end
