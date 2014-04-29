class CreateSystemTechnicals < ActiveRecord::Migration
  def change
    create_table :system_technicals do |t|
      t.references :system
      t.references :technical 
      t.timestamps
    end
  end
end
