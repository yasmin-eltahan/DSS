class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
    t.string "name"
    t.string "description"
      t.timestamps
    end
  end
end
