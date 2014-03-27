class Suggestion < ActiveRecord::Base
  belongs_to :annotation
  belongs_to :author, :class_name => "User"

end
