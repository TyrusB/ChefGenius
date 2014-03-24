module Annotatable
  extend ActiveSupport::Concern

  included do
    has_many :annotations, :as => :annotatable, :dependent => :destroy
  end

end