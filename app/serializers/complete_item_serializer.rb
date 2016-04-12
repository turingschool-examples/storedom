class CompleteItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :uname, :order_count

  has_many :orders, serializer: ItemOrderSerializer

  def uname
    object.name.upcase
  end

  def order_count
    object.orders.count
  end

end
