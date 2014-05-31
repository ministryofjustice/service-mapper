crumb :root do
  link "Home", root_path
end

crumb :services do
  link "Services", services_path
end

crumb :service do |service|
  link "'#{service.name}'", service_path(service)
  parent :services
end

crumb :stories do
  link "Stories", stories_path
end

crumb :story do |story|
  link "'#{story.name}'", story_path(story)
  parent :stories
end

crumb :story_stages do |story|
  link "Story Stages", story_story_stages_path(story)
  parent :story, story
end

crumb :story_stage do |story_stage|
  link story_stage.position, story_story_stage_path(story_stage.story, story_stage)
  parent :story_stages, story_stage.story
end
