#===========================================================================
# POST CONTROLLER
#===========================================================================
class PostsController < ApplicationController

  #-------------------------------------------------------------------------
  # INDEX
  #-------------------------------------------------------------------------
  def index 
    render json: Post.all, each_serializer: PostDetailSerializer
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      render json: { message: "Successfully created the Post.", post: @post, serializer: PostDetailSerializer }
    else
      render json: { message: @post.errors.full_messages }
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :description, :user_id)
  end
end
