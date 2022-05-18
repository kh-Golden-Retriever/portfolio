class LikesController < ApplicationController
  def create
    if @gift.user_id != current_user.id
      @like = Like.create!(user_id: current_user.id, gift_id: @gift.id)
    end
  end

  def destroy
    @like = @gift.likes.find(current_user.id)
    @like.destroy!
  end

  private

  def set_gift
    @gift = Gift.find(params[:gift_id])
  end

end
