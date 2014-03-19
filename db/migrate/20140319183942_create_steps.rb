class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :description, null: false
      t.integer :ord, null: false

      t.integer :recipe_id, null: false

      t.timestamps
    end

    add_index :steps, :recipe_id
    add_index :steps, [:recipe_id, :ord], unique: true
  end
end
