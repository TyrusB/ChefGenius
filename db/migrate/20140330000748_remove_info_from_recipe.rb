class RemoveInfoFromRecipe < ActiveRecord::Migration
  def change
    remove_column :recipes, :cook_time
    remove_column :recipes, :prep_time
  end
end
