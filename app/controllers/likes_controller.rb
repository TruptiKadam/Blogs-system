#===========================================================================
# LIKES CONTROLLER
#===========================================================================
class LikesController < ApplicationController

  #-------------------------------------------------------------------------
  # CREATE
  #-------------------------------------------------------------------------

  def create
    @like = Like.new(like_params)
    if @like.save!
      render json: { message: "Successfully created the like.", like: @like, serializer: LikeSerializer }
    else
      render json: { message: @like.errors.full_messages }
    end
  end

  private
  
  def like_params
    params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
  end

end
