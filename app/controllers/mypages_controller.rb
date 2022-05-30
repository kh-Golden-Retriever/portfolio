class MypagesController < ApplicationController
  def top
  end

  def index
    current_users_gifts = current_user.gifts

  case params[:sort_id]
    when 'index' then
        @page_title = '自分のGift一覧'
        @gifts = current_user.gifts
    when 'display' then
        @page_title = '公開しているGift'
        @gifts = current_user.gifts.display
    when 'done_deal' then
        @page_title = '渡したGift'
        @gifts = current_user.gifts.joins(:done_deal)
    when 'undisplay' then
        @page_title = '非公開・下書き'
        @gifts = current_user.gifts.undisplay
    when 'gotten' then
        @page_title = '受け取ったGift'
        @gifts = Gift.joins(:done_deal).where(user_id: current_user.id)
    when 'liked' then
        @page_title = 'いいねしたGift'
        @gifts = current_user.like_gifts
  end

    respond_to do |f|
      f.js { render :index }
    end
  end
end
