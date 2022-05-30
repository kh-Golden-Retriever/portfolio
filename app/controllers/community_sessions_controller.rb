class CommunitySessionsController < ApplicationController
  skip_before_action :set_current_community, only: %i[ new create ]

  def new
    @community = Community.new
  end

  def create
    @community = Community.find(params[:id])
    session[:community_id] = @community.id
    redirect_to gifts_path, success: "#{@community.name}に参加しました"
  end

end
