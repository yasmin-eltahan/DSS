class Edit < ActiveRecord::Migration
  def up
  	add_column :systems , :name, :string
  	add_column :systems , :programming_language, :string
  	add_column :systems , :no_of_employees, :integer
  end

  def down
  end
end
