class LandingPagesController < ApplicationController
  skip_before_action :require_login
  skip_before_action :set_current_community
  skip_before_action :set_notifications

  def top
  end
end
