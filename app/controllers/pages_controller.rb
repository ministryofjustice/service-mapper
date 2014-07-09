class PagesController < ApplicationController
  skip_before_filter :authenticate_verified_user!, only: [:unverified]
  skip_before_filter :authenticate_admin!, only: [:unverified]
end
