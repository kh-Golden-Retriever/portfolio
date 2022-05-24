class CommunitiesController < ApplicationController
  before_action :require_login
  
  def show
  end

  def new
    @community = current_user.communities.new
  end

  def create
    @community = current_user.communities.new(community_params)
    if @community.save
      redirect_to gifts_path(@community), success: 'success'
    else
      flash.now[:danger] = 'failed'
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def community_params
    params.require(:community).permit(:name)
  end
end
