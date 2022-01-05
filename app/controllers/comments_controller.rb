#===========================================================================
# COMMENTS CONTROLLER
#===========================================================================
class CommentsController < ApplicationController

  #-------------------------------------------------------------------------
  # CREATE
  #-------------------------------------------------------------------------

  def create
    binding.pry
    @post = Post.find_by_id(comment_params['post_id'])
    if @post.present?
      @comment = @post.comments.build(comment_params)
      if @comment.save!
        render json: { message: "Successfully created the comment.", comment: @comment, serializer: CommentSerializer }
      else
        render json: { message: @comment.errors.full_messages }
      end
    else
      render json: { message: "Post is not valid" }
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:description, :user_id, :post_id)
  end

end
