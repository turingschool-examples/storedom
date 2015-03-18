class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  def self.most_popular
    # Returns the three items that have been ordered the most
    # What was this person thinking?! Seriously(!)
    Order.all.map(&:items).flatten.each_with_object(Hash.new(0)) { |item, counts|
      counts[item] +=1
    }.sort_by { |item, count| count }.last(3).map(&:first)
  end

  def purchasers
    # find all of the users who have ordered this same item.
    order_ids = OrderItem.all.select { |order_item| order_item.item_id == id }.map(&:order_id)
    orders = Order.find(order_ids)
    orders.map(&:user)
  end

  def self.ordered
    # Hint: joins is your friend.
    orders = Order.all
    items = orders.flat_map do |order|
      order.items
    end.uniq
  end
end
