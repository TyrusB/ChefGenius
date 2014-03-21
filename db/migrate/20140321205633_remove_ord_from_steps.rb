class RemoveOrdFromSteps < ActiveRecord::Migration
  def change
    remove_column :steps, :ord
  end
end
