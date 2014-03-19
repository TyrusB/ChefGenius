class CreateRecipeNeeds < ActiveRecord::Migration
  def change
    create_table :recipe_needs do |t|
      t.integer :recipe_id
      t.integer :ingredient_id

      t.float :amount
      t.string :amount_type

      t.timestamps
    end
  end
end
