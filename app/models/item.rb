class Item < ActiveRecord::Base
  default_scope { where(status: "active") }

  has_many :order_items
  has_many :orders, through: :order_items
end
