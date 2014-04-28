class AlterReviews < ActiveRecord::Migration
  def up
  	change_column :reviews, :review, :string
  	add_column :reviews, :review2, :string
  	add_column :reviews, :review3, :string
  	remove_column :reviews , :version_id
  	add_column :reviews , :system_id , :integer
  	add_column :reviews , :reviewer , :string
  end

  def down
  end
end
