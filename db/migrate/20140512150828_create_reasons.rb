class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
    	t.references :company
    	t.references :criterion
    	t.references :user
    	t.text "reason"
      t.timestamps
    end
  end
end