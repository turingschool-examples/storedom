class PermissionService
  def initialize(user, controller, action)
    @user       = user
    @controller = controller
    @action     = action
  end

  def authorized?
    if user.registered_user?
      return true if controller == "stores" && action.in?(%w(index show))
      return true if controller == "items" && action.in?(%w(index show))
      return true if controller == "sessions" && action.in?(%w(new create destroy))
    else
      return true if controller == "stores" && action.in?(%w(index show))
      return true if controller == "sessions" && action.in?(%w(new create destroy))
    end
  end


  private
  attr_reader :user, :controller, :action
end
