class EditCompanycriteria < ActiveRecord::Migration
  def up
  	add_column :company_criterions, :user_id, :integer
  end

  def down
  end
end
