class AlterValue6 < ActiveRecord::Migration
  def up
  	change_column :company_criteria , :value , :decimal , :precision => 16, :scale => 2
  end

  def down
  end

end
