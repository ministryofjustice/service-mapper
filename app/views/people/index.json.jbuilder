json.array!(@people) do |person|
  json.extract! person, :id, :role, :description
  json.url person_url(person, format: :json)
end
