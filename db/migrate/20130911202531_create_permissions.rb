class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :slug
      t.text :description

      t.timestamps
    end
    add_index :permissions, :slug
  end
end
