class PermissionService
  def initialize(user, controller, action)
    @user       = user || User.new
    @controller = controller
    @action     = action
  end

  def authorized?
    if user.platform_admin?
      platform_admin_permissions
    elsif user.store_admin?
      store_admin_permissions
    elsif user.registered_user?
      registered_user_permissions
    else
      guest_user_permissions
    end
  end

  private
  attr_reader :user, :controller, :action

  def guest_user_permissions
    return true if controller == "stores"   && action == "index"
    return true if controller == "sessions" && action.in?(%w(new create destroy))
  end

  def registered_user_permissions
    return true if controller == "stores"   && action == "index"
    return true if controller == "sessions" && action.in?(%w(new create destroy))
    return true if controller == "items"  && action.in?(%w(index show))
  end

  def store_admin_permissions
    return true if controller == "stores"   && action == "index"
    return true if controller == "sessions" && action.in?(%w(new create destroy))
    return true if controller == "items"  && action.in?(%w(index show))
    return true if controller == "orders" && action.in?(%w(index show))
  end

  def platform_admin_permissions
    return true if controller == "stores"   && action == "index"
    return true if controller == "sessions" && action.in?(%w(new create destroy))
    return true if controller == "users"  && action.in?(%w(index show))
    return true if controller == "items"  && action.in?(%w(index show))
    return true if controller == "orders" && action.in?(%w(index show))
  end
end

