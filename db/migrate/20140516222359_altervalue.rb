class Altervalue < ActiveRecord::Migration
  def up
  	change_column :company_criterions , :value , :decimal , :precision => 6, :scale => 2
  end

  def down
  end
end
