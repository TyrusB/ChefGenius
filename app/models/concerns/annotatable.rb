# A basic concern for adding annotatable functionality to models.
#   Adds the polymorphic association for annotations.

module Annotatable
  extend ActiveSupport::Concern

  included do
    has_many :annotations, :as => :annotatable, :dependent => :destroy
  end

end