class CreateStepsTable < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :description

      t.integer :recipe_id

      t.timestamps
    end
  end
end
