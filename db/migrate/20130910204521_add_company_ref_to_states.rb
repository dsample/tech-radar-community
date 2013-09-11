class AddCompanyRefToStates < ActiveRecord::Migration
  def change
    add_column :states, :company_id, :integer
  end
end
