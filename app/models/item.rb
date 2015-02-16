class Item < ActiveRecord::Base
  belongs_to :store

  has_many :order_items
  has_many :orders, through: :order_items
end
