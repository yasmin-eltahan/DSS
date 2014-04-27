class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.string "review"
    	t.string "source"
    	t.string "result"
    	t.references :version

      t.timestamps
    end
  end
end
