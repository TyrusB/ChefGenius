class AddAuthorIdToRecipesAnnotationsAndController < ActiveRecord::Migration
  def change
    add_column :recipes, :author_id, :integer, null: false
    add_column :annotations, :author_id, :integer, null: false
    add_column :suggestions, :author_id, :integer, null: false
  end
end
