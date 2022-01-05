#===========================================================================
# USERS CONTROLLER
#===========================================================================
class UsersController < ApplicationController

  #-------------------------------------------------------------------------
  # INDEX
  #-------------------------------------------------------------------------
  def index
    render json: User.all, each_serializer: UserListSerializer
  end

  #-------------------------------------------------------------------------
  # show
  #-------------------------------------------------------------------------
  def show
    @user = User.find_by_id(params[:id])
    render json: @user, serializer: UserShowSerializer
  end

  #-------------------------------------------------------------------------
  # CREATE
  #-------------------------------------------------------------------------
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: "Successfully created the User.", user: @user, serializer: UserSerializer }
    else
      render json: { message: @user.errors.full_messages }
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
