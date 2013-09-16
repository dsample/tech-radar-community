class CreateUserCompanyRoles < ActiveRecord::Migration
  def change
    create_table :user_company_roles do |t|
      t.belongs_to :company
      t.references :user
      t.references :role

      t.timestamps
    end
    add_index :user_company_roles, :company_id
    add_index :user_company_roles, :user_id
    add_index :user_company_roles, :role_id
  end
end
