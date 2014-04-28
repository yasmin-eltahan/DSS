class Altersystems < ActiveRecord::Migration
  def up 
  	 	add_column :systems, :description , :text
  end

  def down
  end
end
