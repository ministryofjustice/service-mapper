class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :authenticate_verified_user!
  before_action :authenticate_admin!, except: [:show, :index]

  private

  def authenticate_verified_user!
    if current_user
      unless ["editor", "verified"].include?(current_user.role)
        render :text => "Your account has not been verified yet"
        return false
      end
    end
  end

  def authenticate_admin!
    if current_user
      unless current_user.role == "editor"
        render :text => "You can only access this page if you are an admin"
        return false
      end
    end
  end
end
