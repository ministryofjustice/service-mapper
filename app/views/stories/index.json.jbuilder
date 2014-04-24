json.array!(@stories) do |story|
  json.extract! story, :id, :name, :status, :owner, :description
  json.url story_url(story, format: :json)
end
