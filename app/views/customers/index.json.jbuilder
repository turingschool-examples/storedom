json.array!(@customers) do |customer|
  json.extract! customer, :id, :name
  json.url customer_url(customer, format: :json)
end
