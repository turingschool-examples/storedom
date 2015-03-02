class Order < ActiveRecord::Base
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  def self.most_recent
    # Find the first ten orders sorted by date created
    all.sort_by { |order| order.created_at }.last(10)
  end
end
