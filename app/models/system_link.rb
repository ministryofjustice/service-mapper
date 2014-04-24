class SystemLink < ActiveRecord::Base
  belongs_to :system_a
  belongs_to :system_b
end
