class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.belongs_to :category
      t.string :name
      t.text :summary
      t.text :description

      t.timestamps
    end
    add_index :technologies, :category_id
  end
end
