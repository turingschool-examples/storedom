class ShortItemSerializer < ActiveModel::Serializer
  attributes :name, :order_count

  def order_count
    object.orders.count
  end
end
