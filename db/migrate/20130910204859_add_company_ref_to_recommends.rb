class AddCompanyRefToRecommends < ActiveRecord::Migration
  def change
    add_column :recommends, :company_id, :integer
  end
end
