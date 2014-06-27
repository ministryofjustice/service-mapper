crumb :root do
  link "Transactions", root_path
end

crumb :new_transaction do
  link "New Transaction", new_story_path
  parent :root
end

crumb :story do |story|
  link "'#{story.name}'", story_path(story)
  parent :root
end

crumb :story_stages do |story|
  link "Transaction Stages", story_story_stages_path(story)
  parent :story, story
end

crumb :story_stage do |story_stage|
  link story_stage.position, story_story_stage_path(story_stage.story, story_stage)
  parent :story_stages, story_stage.story
end
