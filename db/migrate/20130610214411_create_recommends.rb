class CreateRecommends < ActiveRecord::Migration
  def change
    create_table :recommends do |t|
      t.references :recommendable, :polymorphic => true
      t.references :recommendation
      t.text :context

      t.timestamps
    end
    add_index :recommends, :recommendable_id
  end
end
