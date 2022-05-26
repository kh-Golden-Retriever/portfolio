class LikesController < ApplicationController
  before_action :set_gift, only: %i[ create destroy ]

  def create
    if @gift.user_id != current_user.id
      @like = Like.create!(user_id: current_user.id, gift_id: @gift.id)
      @like.notifications.new(notifying_user: @gift.user, notified_user: current_user)
      @like.save
    end
  end

  def destroy
    @like = @gift.likes.find_by(user_id: current_user.id)
    @like.destroy!
  end

  private

  def set_gift
    @gift = Gift.find(params[:gift_id])
  end

end
