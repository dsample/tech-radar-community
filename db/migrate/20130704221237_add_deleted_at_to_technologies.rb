class AddDeletedAtToTechnologies < ActiveRecord::Migration
  def change
    add_column :technologies, :deleted_at, :datetime, :null => true
  end
end
