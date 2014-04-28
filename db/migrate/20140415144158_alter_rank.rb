class AlterRank < ActiveRecord::Migration
  def up
  	add_column :ranks , :source , :string
  	remove_column :ranks , :version_id
  	add_column :ranks , :system_id , :integer
  end

  def down
  end
end
