class AlterWeight < ActiveRecord::Migration
  def up
  	change_column :company_criteria , :weight , :integer , :default => 0
  end

  def down
  end
end
