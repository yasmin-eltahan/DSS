class ChangeRequirements < ActiveRecord::Migration
  def up
  	add_column :requirements , :type_id, :integer
  	remove_column  :requirements , :technical
  end

  def down
  end
end
