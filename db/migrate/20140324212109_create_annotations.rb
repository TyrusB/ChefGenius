class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.text :content
      t.integer :annotatable_id
      t.integer :annotatable_type

      t.timestamps
    end
  end
end
