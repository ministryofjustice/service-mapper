json.array!(@story_stages) do |story_stage|
  json.extract! story_stage, :id, :story_id, :from_id, :from_type, :to_id, :to_type, :position, :payload, :description
  json.url story_stage_url(story_stage, format: :json)
end
