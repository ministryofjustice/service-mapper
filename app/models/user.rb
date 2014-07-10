class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_create :editor_if_dsd

  def editor_if_dsd
    if self.email[-23..-1] == '@digital.justice.gov.uk'
      self.role = 'editor'
    end
  end
end
