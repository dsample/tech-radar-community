class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
