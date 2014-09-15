class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Order, :user_id => user.id
  end
end
