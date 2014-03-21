class CreateNotesTable < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :description

      t.integer :recipe_id

      t.timestamps
    end
  end
end
