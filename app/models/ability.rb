class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Order, Order.managed_by_user(user.id) do |order|
      order.user.manager_id == user.id
    end
  end
end
