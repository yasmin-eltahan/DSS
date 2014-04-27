class CreateSystemRequirements < ActiveRecord::Migration
  def change
    create_table :system_requirements do |t|
    t.references :system
    t.references :requirement
    t.string "value"
    t.timestamps
    end
  end
end
