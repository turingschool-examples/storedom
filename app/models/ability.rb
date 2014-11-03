class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # This will work, but you're better off using a scope.
    can :manage, Order, Order.includes(:user).where(users: { manager_id: user.id }) do |order|
      order.user.manager_id == user.id
    end
  end
end
