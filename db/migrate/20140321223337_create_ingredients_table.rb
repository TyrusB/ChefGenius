class CreateIngredientsTable < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :description

      t.integer :recipe_id

      t.timestamps
    end
  end
end
