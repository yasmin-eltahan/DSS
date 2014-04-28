class Alterreviews < ActiveRecord::Migration
  def up
  	change_column :reviews, :review, :text
  end

  def down
  end
end
