# == Schema Information
#
# Table name: recipes
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Recipe < ActiveRecord::Base
  validates :name, presence: true, :uniqueness => true

  has_many :ingredients, :dependent => :destroy
  has_many :steps, -> { order 'steps.created_at' }, :dependent => :destroy
  has_one :note, :dependent => :destroy
  has_one :info, :dependent => :destroy

  belongs_to :author, :class_name => "User"

  accepts_nested_attributes_for :ingredients, :steps, :note, :info

  has_attached_file :title_photo, :styles => {
    :small => "150x150>",
    :large => "500x500#"
  }
  validates_attachment_content_type :title_photo, :content_type => /\Aimage\/.*\Z/

end
