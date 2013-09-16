class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :company
      t.string :name

      t.timestamps
    end
  end
end
