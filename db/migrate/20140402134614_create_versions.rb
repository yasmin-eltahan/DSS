class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string "name"
      t.integer "year"
      t.integer "Price"
      t.references :system
      t.timestamps
    end
  end
end
