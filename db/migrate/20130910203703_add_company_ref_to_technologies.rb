class AddCompanyRefToTechnologies < ActiveRecord::Migration
  def change
    add_column :technologies, :company_id, :integer
  end
end
