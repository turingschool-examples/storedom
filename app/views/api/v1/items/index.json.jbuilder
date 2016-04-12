json.(@items) do |item|
  json.(item, :id, :name)
  json.uname(item.name.upcase)
  json.order_count(item.orders.count)
  json.orders item.orders do |order|
    json.(order, :id)
  end
  json._links {
    self: api_v1_item_url(item.id)
  }
end
