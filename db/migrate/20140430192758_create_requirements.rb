class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
    	t.string "name"
    	t.references :type
      t.timestamps
    end
  end
end
