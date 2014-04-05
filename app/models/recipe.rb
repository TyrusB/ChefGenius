# == Schema Information
#
# Table name: recipes
#
#  id                       :integer          not null, primary key
#  name                     :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  author_id                :integer          not null
#  title_photo_file_name    :string(255)
#  title_photo_content_type :string(255)
#  title_photo_file_size    :integer
#  title_photo_updated_at   :datetime
#  category                 :string(255)      default("Main Course"), not null
#

class Recipe < ActiveRecord::Base
  validates :name, presence: true, :uniqueness => true
  validates :category, inclusion: { in: ["Main Course", "Appetizer", "Dessert"] }

  has_many :ingredients, :dependent => :destroy
  has_many :steps, -> { order 'steps.created_at' }, :dependent => :destroy
  has_one :note, :dependent => :destroy
  has_one :info, :dependent => :destroy

  belongs_to :author, :class_name => "User"

  accepts_nested_attributes_for :ingredients, :steps, :note, :info

  has_attached_file :title_photo, :styles => {
    :small => "180x180>",
    :large => "500x500#"
  }
  validates_attachment_content_type :title_photo, :content_type => /image/

end
