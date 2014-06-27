namespace :archipelago do
  task :migrate_to_groups => :environment do
    Story.all.each do |story|
      story.groups << story.group
      story.save!
    end
  end
end
