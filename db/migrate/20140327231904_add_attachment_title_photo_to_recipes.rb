class AddAttachmentTitlePhotoToRecipes < ActiveRecord::Migration
  def self.up
    change_table :recipes do |t|
      t.attachment :title_photo
    end
  end

  def self.down
    drop_attached_file :recipes, :title_photo
  end
end
