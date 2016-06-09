class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  # after_create :clear_cache ## Create
  after_save :clear_cache   ## Update and Create
  after_destroy :clear_cache## Delete


  def clear_cache
    Rails.cache.clear
  end
end
