class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
    	t.integer "rank"
    	t.references :version
 
      t.timestamps
    end
  end
end
