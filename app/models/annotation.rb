class Annotation < ActiveRecord::Base
  belongs_to :annotatable, :polymorphic => true

  has_many :suggestions
end
