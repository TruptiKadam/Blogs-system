#===========================================================================
# POST DETAIL SERIALIZER
#===========================================================================
class PostDetailSerializer < ActiveModel::Serializer

  #=========================================================================
  # ATTRIBUTES
  #=========================================================================
  attributes :id, :title, :description

  has_many :comments, serializer: CommentSerializer
  has_many :likes, serializer: LikeSerializer
  has_one :user, serializer: UserSerializer

end
