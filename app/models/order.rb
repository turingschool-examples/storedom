class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :store

  has_many :order_items
  has_many :items, through: :order_items
end
