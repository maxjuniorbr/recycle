json.array!(@garbages) do |garbage|
  json.extract! garbage, :id, :name, :image
  json.url garbage_url(garbage, format: :json)
end
