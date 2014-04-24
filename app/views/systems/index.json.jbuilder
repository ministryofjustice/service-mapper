json.array!(@systems) do |system|
  json.extract! system, :id, :owner, :supplier, :technology, :status, :hosting, :impact_level
  json.url system_url(system, format: :json)
end
