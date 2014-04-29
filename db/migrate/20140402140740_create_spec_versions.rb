class CreateSpecVersions < ActiveRecord::Migration
  def change
    create_table :spec_versions do |t|
      t.references :spec
      t.references :version
      t.timestamps
    end
  end
end
