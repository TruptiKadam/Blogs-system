#===========================================================================
# USER LIST SERIALIZER
#===========================================================================
class UserListSerializer < ActiveModel::Serializer

  #=========================================================================
  # ATTRIBUTES
  #=========================================================================
  attributes :id, :first_name, :last_name, :email, :number_of_posts

  def number_of_posts
    object.posts.count
  end

  # has_many :posts, serializer: PostDetailSerializer
end
