class AddDesc < ActiveRecord::Migration
  def up
  	add_column :companies, :description, :text
  end

  def down
  end
end
