#===========================================================================
# LIKE SERIALIZER
#===========================================================================
class LikeSerializer < ActiveModel::Serializer

  #=========================================================================
  # ATTRIBUTES
  #=========================================================================
  attributes :id, :user_id, :likeable_id, :likeable_type

end
