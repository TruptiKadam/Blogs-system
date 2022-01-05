#===========================================================================
# LIKE
#===========================================================================
class Like < ActiveRecord::Base

  #=========================================================================
  # RELATIONS
  #=========================================================================
  belongs_to :user
  belongs_to :imageable, polymorphic: true

end
