class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items
  has_one  :photograph, as: :photographable
  has_many :categorizations
  has_many :categories, :through => :categorizations
end
