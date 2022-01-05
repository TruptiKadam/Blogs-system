#===========================================================================
# USER SHOW SERIALIZER
#===========================================================================
class UserShowSerializer < ActiveModel::Serializer

  #=========================================================================
  # ATTRIBUTES
  #=========================================================================
  attributes :id, :first_name, :last_name, :email

  has_many :posts, serializer: PostSerializer
end
