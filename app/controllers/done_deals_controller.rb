class DoneDealsController < ApplicationController
  
  def create
    @gift = Gift.find(params[:gift_id])
    @gifted_user = User.find(params[:user_id])
    @done_deal = DoneDeal.create!(gift_id: @gift.id, user_id: @gifted_user.id)
    redirect_to gift_path(@gift), success: "このGiftは#{@gifted_user.name}さんが受け取りました"
  end

  def destroy
    @gift = Gift.find(params[:gift_id])
    @gifted_user = User.find(@gift.done_deal.user_id)
    @gift.done_deal.destroy!
    redirect_to gift_path(@gift), warning: "#{@gifted_user.name}さんとの取引を取り消しました"
  end
end
