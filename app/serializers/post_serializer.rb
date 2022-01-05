#===========================================================================
# POST SERIALIZER
#===========================================================================
class PostSerializer < ActiveModel::Serializer

  #=========================================================================
  # ATTRIBUTES
  #=========================================================================
  attributes :id, :title, :description, :comments_count, :likes_count

  def comments_count
    object.comments.count
  end

  def likes_count
    object.likes.count
  end
end
