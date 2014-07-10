FactoryGirl.define do
  factory :service do
  end
  factory :story do
  end
  factory :story_stage do
  end
  factory :system do
  end
  factory :group do
  end
  factory :user do
    email 'test.user@digital.justice.gov.uk'
    password 'password'
    password_confirmation 'password'
  end
end