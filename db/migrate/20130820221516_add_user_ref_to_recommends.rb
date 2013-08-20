class AddUserRefToRecommends < ActiveRecord::Migration
  def change
    add_column :recommends, :user_id, :integer
    add_index :recommends, :user_id
  end
end
