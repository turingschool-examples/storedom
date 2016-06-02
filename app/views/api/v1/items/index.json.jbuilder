json.(@items) do |item|
  json.(item, :id, :name)
  json.uname(item.name.upcase)
  json.order_count(item.orders.count)
end
