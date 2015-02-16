class Permission
  extend Forwardable

  attr_reader :user, :controller, :action

  def_delegators :user, :platform_admin?,
                        :store_admin?,
                        :user?

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action     = action

    case
    when platform_admin?
      platform_admin_permissions
    when store_admin?
      store_admin_permissions
    when user?
      user_permissions
    else
      guest_permissions
    end
  end

  private

  def platform_admin_permissions
    return true if controller == "sessions"
    return true if controller == "items"  && action.in?(%w(index show))
    return true if controller == "stores" && action.in?(%w(index show))
    return true if controller == "orders" && action.in?(%w(index show))
    return true if controller == "users"  && action.in?(%w(index show))
  end

  def store_admin_permissions
    return true if controller == "sessions"
    return true if controller == "items"  && action.in?(%w(index show))
    return true if controller == "stores" && action.in?(%w(index show))
    return true if controller == "orders" && action.in?(%w(index show))
  end

  def user_permissions
    return true if controller == "sessions"
    return true if controller == "items"  && action.in?(%w(index show))
    return true if controller == "stores" && action.in?(%w(index show))
  end

  def guest_permissions
    return true if controller == "sessions"
    return true if controller == "items"  && action.in?(%w(index show))
    return true if controller == "stores" && action.in?(%w(index))
  end
end
