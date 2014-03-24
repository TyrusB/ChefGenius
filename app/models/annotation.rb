class Annotation < ActiveRecord::Base
  belongs_to :annotatable, :polymorphic => true
end
