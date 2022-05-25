class LandingPagesController < ApplicationController
  skip_before_action :require_login
  skip_before_action :set_current_community

  def top
  end
end
