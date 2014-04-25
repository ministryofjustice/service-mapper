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

crumb :stories do |service|
  link "Stories", service_stories_path(service)
  parent :service, service
end

crumb :story do |story|
  link "'#{story.name}'", service_story_path(story.service, story)
  parent :stories, story.service
end

crumb :story_stages do |story|
  link "Story Stages", service_story_story_stages_path(story.service, story)
  parent :story, story
end

crumb :story_stage do |story_stage|
  link story_stage.position, service_story_story_stage_path(story_stage.story.service, story_stage.story, story_stage)
  parent :story_stages, story_stage.story
end
