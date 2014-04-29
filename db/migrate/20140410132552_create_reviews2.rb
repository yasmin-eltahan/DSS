class CreateReviews2 < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.string "review"
    	t.string "review2"
    	t.string "review3"
    	t.string "reviewer"
    	t.string "source"
    	t.string "result"
    	t.references :system

      t.timestamps
    end
  end
end