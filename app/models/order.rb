class Order < ActiveRecord::Base
  belongs_to :user

  scope :managed_by_user, ->(user) { includes(:user).where(users: { manager_id: user }) }

  has_many :order_items
  has_many :items, through: :order_items
end
