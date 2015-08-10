class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  after_create :clear_cache
  after_save :clear_cache
  after_destroy :clear_cache

  def clear_cache
    Rails.cache.clear
  end
end
