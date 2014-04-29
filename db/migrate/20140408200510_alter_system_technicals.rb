class AlterSystemTechnicals < ActiveRecord::Migration
  def up
  	add_column :system_technicals , :value, :string
  end

  def down
  end
end
