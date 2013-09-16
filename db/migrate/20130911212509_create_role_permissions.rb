class CreateRolePermissions < ActiveRecord::Migration
  def change
    create_table :role_permissions do |t|
      t.belongs_to :role
      t.belongs_to :permission

      t.timestamps
    end
    add_index :role_permissions, :role_id
    add_index :role_permissions, :permission_id
  end
end
