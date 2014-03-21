class CreateInfoTable < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :cook_time
      t.string :prep_time

      t.integer :recipe_id
    end
  end
end
