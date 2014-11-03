json.array!(@logins) do |login|
  json.extract! login, :id, :name, :customer_id
  json.url login_url(login, format: :json)
end
