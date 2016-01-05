class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  validates :name, uniqueness: true
end
