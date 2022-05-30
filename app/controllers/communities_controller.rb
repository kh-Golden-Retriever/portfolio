class CommunitiesController < ApplicationController
  before_action :require_login
  skip_before_action :set_current_community, only: %i[ new create ]
  
  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    # コミュニティの製作者を入れる
    @community.user_id = current_user.id
    if @community.save
      # コミュニティと紐付ける
      @user_community = UserCommunity.create(user_id: current_user.id, community_id: @community.id)
      # セッションに入れてcurrent_communityを使えるようにする
      session[:community_id] = @community.id
      redirect_to gifts_path, success: 'success'
    else
      flash.now[:danger] = 'failed'
      render :new
    end
  end

  private

  def community_params
    params.require(:community).permit(:name)
  end
end
