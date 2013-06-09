class CreateProductTechnologies < ActiveRecord::Migration
  def change
    create_table :product_technologies do |t|
      t.belongs_to :product
      t.references :technology

      t.timestamps
    end
    add_index :product_technologies, :product_id
    add_index :product_technologies, :technology_id
  end
end
