class Alter7 < ActiveRecord::Migration
  def up
  	change_column :company_criterions , :value , :decimal , :precision => 6, :scale => 2 , :defalut =>0
  end

  def down
  end
end
