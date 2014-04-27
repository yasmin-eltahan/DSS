class SystemTechnical < ActiveRecord::Migration
  def up
  	create_table :systems_technicals, :id => false do |t|
  		t.integer "system_id"
  		t.integer "technical_id" 
      t.timestamps
    end
  end

  def down
  end
end
