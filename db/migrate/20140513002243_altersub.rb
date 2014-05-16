class Altersub < ActiveRecord::Migration
  def up
  	add_column :company_subcriterions, :weight, :integer, :default =>0
  end

  def down
  end
end
