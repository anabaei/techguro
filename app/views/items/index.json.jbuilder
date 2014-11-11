json.array!(@items) do |item|
  json.extract! item, :id, :name, :tags, :count, :supplier, :stock
  json.url item_url(item, format: :json)
end
