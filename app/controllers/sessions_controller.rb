class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, success: "Welcome to Storedom, #{user.name}"
    else
      flash.now[:danger] = "The username or password is invalid. Please try again."
      render :new
    end
  end

  def destroy
    session.clear

    redirect_to root_path, success: "You have been logged out."
  end
end
