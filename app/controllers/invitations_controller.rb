class InvitationsController < ApplicationController
  def generate_token
    @token = @current_community.community_tokens.new
    @token.expires_at = 7.days.since
    @token.uuid = SecureRandom.uuid
    @token.save!
    @url = new_invitation_url(uuid: @token.uuid)

    # response do |f|
    #   f.js { render :generate_token }
    # end
  end

  def new
    @token = CommunityToken.find_by(uuid: params[:uuid])
    @community = Community.find(@token.community_id)
    @user = @community.users.new
  end

  def create
    @token = CommunityToken.find_by(uuid: params[:uuid])
    @community = Community.find(@token.community_id)
    @user = @community.users.new(user_params)
    
    if @user.save
      UserCommunity.create!(user_id: @user.id, community_id: @community.id)
      redirect_to gifts_path, success: 'success'
    else
      flash.now[:danger] = 'failed'
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache)
  end
end
