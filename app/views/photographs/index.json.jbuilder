json.array!(@photographs) do |photograph|
  json.extract! photograph, :id, :url, :photographable_id, :photographable_type
  json.url photograph_url(photograph, format: :json)
end
