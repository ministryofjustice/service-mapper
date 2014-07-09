class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :authenticate_verified_user!
  before_action :authenticate_admin!, except: [:show, :index]

  # layout 'moj_template'

  private

  def authenticate_verified_user!
    if current_user
      unless ["editor", "verified"].include?(current_user.role)
        redirect_to '/unverified'
        return false
      end
    end
  end

  def authenticate_admin!
    if current_user
      unless current_user.role == "editor"
        render :text => "Your account is not permitted to view this"        
        return false
      end
    end
  end
end
