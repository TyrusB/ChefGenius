class AddInfoToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :notes, :text
    add_column :recipes, :prep_time, :string
    add_column :recipes, :cook_time, :string
  end
end
