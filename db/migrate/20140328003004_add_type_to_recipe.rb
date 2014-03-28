class AddTypeToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :category, :string, :null => false, :default => "Main Course"
  end
end
