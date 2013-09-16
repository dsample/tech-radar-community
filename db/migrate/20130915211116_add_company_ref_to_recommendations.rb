class AddCompanyRefToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :company_id, :integer
  end
end
