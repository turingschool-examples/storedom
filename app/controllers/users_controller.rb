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
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "The user was created."
    else
      flash.now[:notice] = "The user was not created."
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: "The user was updated."
    else
      flash.now[:notice] = "The user was not updated."
      render :edit
    end
  end

  def destroy
    User.destroy(params[:id])

    redirect_to users_path, notice: "The user was deleted."
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
