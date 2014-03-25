class AddStartPosAndStopPosToAnnotations < ActiveRecord::Migration
  def change
    add_column :annotations, :start_pos, :integer, :null => false
    add_column :annotations, :end_pos, :integer, :null => false
  end
end
