class Permission
  extend Forwardable

  def_delegators :user, :platform_admin?,
                 :store_admin?,
                 :registered_user?

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
    when registered_user?
      registered_user_permissions
    else
      guest_user_permissions
    end
  end

  private
    def user
      @user
    end

    def platform_admin_permissions
      return true if @controller == "sessions" && @action.in?(%w(new create destroy))
      return true if @controller == "stores"   && @action.in?(%w(index show))
      return true if @controller == "items"    && @action.in?(%w(index show))
      return true if @controller == "orders"   && @action.in?(%w(index))
      return true if @controller == "users"    && @action.in?(%w(show index))
    end

    def store_admin_permissions
      return true if @controller == "sessions" && @action.in?(%w(new create destroy))
      return true if @controller == "stores" && @action.in?(%w(index show))
      return true if @controller == "items" && @action.in?(%w(index show))
      return true if @controller == "orders" && @action.in?(%w(index))
    end

    def registered_user_permissions
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "stores" && action.in?(%w(index show))
      return true if controller == "items" && action.in?(%w(index show))
    end

    def guest_user_permissions
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "stores" && action.in?(%w(index show))
      return true if controller == "items" && action.in?(%w(index))
    end
end
