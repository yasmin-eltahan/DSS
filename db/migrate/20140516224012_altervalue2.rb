class Altervalue2 < ActiveRecord::Migration
  def up
  	change_column :company_systems , :final_score , :decimal , :precision => 6, :scale => 2
  end

  def down
  end
end
