class CreateStepsTable < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :body

      t.integer :recipe_id

    end
  end
end
