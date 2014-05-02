class ChangeRequirements < ActiveRecord::Migration
  def up
  	# add_column :requirements , :type_id, :integer
  	# remove_column  :requirements , :technical
  	add_column :requirements , :description, :string
  end

  def down
  end
end
