class SystemLink < ActiveRecord::Base
  belongs_to :system_a, class_name: "System"
  belongs_to :system_b, class_name: "System"
end
