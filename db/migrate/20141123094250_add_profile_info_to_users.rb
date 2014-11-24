class AddProfileInfoToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.text :user_name
      t.text :about_me
      t.string :phrase
      t.string :location
      t.integer :age
    end
  end
end
