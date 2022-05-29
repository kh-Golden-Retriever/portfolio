class MypagesController < ApplicationController
  def top
  end

  def index
    current_users_gifts = current_user.gifts

  case params[:sort_id]
    when 'display' then
        @page_title = '出品しているGift'
        @gifts = current_user.gifts.display
    when 'undisplay' then
        @page_title = '未出品・下書き'
        @gifts = current_user.gifts.merge(current_user.gifts.undisplay).or((current_user.gifts.draft))
    when 'gotten' then
        @page_title = '受け取ったGift'
        @gifts = current_user.gifts
    when 'liked' then
        @page_title = 'いいねしたGift'
        @gifts = current_user.like_gifts
  end

    respond_to do |f|
      f.js { render :index }
    end
  end
end
