class CreateIngredientsTable < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :description

      t.integer :recipe_id
    end
  end
end
