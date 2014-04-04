json.array!(@products) do |product|
  json.extract! product, :id, :name, :image
  json.garbage product.garbage, :id, :name, :image
end
