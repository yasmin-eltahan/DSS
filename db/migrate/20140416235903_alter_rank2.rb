class AlterRank2 < ActiveRecord::Migration
  def up
  	add_column :ranks , :vendor_id , :integer
  end

  def down
  end
end
