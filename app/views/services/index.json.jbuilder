json.array!(@services) do |service|
  json.extract! service, :id, :name, :status, :owner, :description
  json.url service_url(service, format: :json)
end
