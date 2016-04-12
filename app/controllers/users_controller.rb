class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new( user_params )
    if @user.save
      flash[:notice] = "User Successfully created. Please Log In"
      redirect_to root_path
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :username,
                                 :password,
                                 :password_confirmation)
  end
end
