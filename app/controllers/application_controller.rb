class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  include ActionView::Helpers::TextHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def load_cart
    @cart = Cart.new(session[:cart]) # create a Cart instance, even if params[:cart] is nil
  end
end
