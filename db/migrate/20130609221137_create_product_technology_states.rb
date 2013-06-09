class CreateProductTechnologyStates < ActiveRecord::Migration
  def change
    create_table :product_technology_states do |t|
      t.belongs_to :product_technology
      t.references :state

      t.timestamps
    end
    add_index :product_technology_states, :product_technology_id
    add_index :product_technology_states, :state_id
  end
end
