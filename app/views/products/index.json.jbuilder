json.array!(@products) do |product|
  json.extract! product, :id, :name
  json.garbage product.garbage, :id, :name
end
