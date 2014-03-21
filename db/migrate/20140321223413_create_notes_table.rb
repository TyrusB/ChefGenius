class CreateNotesTable < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body

      t.integer :recipe_id

    end
  end
end
