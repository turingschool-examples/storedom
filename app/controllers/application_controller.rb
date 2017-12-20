class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  before_action :authorize!

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

    def authorize!
      current_permission = PermissionService.new(current_user, params[:controller], params[:action])
      four_oh_four unless current_permission.authorized?
    end

    def four_oh_four
      raise ActionController::RoutingError.new("Not found.")
    end
end
