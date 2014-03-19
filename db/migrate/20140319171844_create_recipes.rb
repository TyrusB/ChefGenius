class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :recipes, :name, unique: true
  end
end
