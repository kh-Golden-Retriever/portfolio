class InvitationsController < ApplicationController
  def generate_token
    @token = @current_community.community_tokens.new
    @token.expires_at = 7.days.since
    @token.uuid = SecureRandom.uuid
    @token.save!
    @url = new_invitation_url(uuid: @token.uuid)
  end

  def new
    @token = CommunityToken.find_by(uuid: params[:uuid])
    @community = Community.find(@token.community_id)
    @user = @community.users.new
  end

  def create
    @token = CommunityToken.find_by(uuid: params[:uuid])
    @community = Community.find(@token.community_id)
    @user = User.find_by(email: params[:user][:email])
    
    unless @user
      @user = User.new(user_params)
      if @user.save
        UserCommunity.create!(user_id: @user.id, community_id: @community.id)
        redirect_to gifts_path, success: 'success'
      else
        flash.now[:danger] = 'failed'
        render :new
      end

      return
    end

    @user_community = UserCommunity.new(user_id: @user.id, community_id: @community.id)
    if @user_community.save
      redirect_to gifts_path, success: 'success'
    else
      flash[:danger] = 'すでに参加しているコミュニティです'
      redirect_to new_invitation_url(uuid: @token.uuid)
    end

  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache)
  end
end
