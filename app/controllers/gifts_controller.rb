class GiftsController < ApplicationController
  before_action :set_current_user_gift, only: %i[ edit update destroy ]

  def index
    @q = @current_community.gifts.ransack(params[:q])
    @gifts = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def show
    @gift = Gift.find(params[:id])
    @comment = Comment.new
    @comments = @gift.comments.includes(:user).order(created_at: :desc)
  end

  def new
    @gift = current_user.gifts.new
  end

  def edit
  end

  def create
    @gift = current_user.gifts.new(gift_params)
    @gift.community_id = @current_community.id
    if @gift.save
      @gift_community = GiftCommunity.create(gift_id: @gift.id, community_id: @current_community.id)
      flash[:success] = 'success!'
      redirect_to gifts_path
    else
      flash.now[:danger] = 'failed!'
      render :new
    end
  end

  def update
    if @gift.update(gift_params)
      flash[:success] = 'success'
      redirect_to gift_path(@gift)
    else
      flash.now[:danger] = 'failed'
      render :edit
    end

  end

  def destroy
    @gift.destroy!
    redirect_to  gifts_path
  end

  private
  
    def set_current_user_gift
      @gift = current_user.gifts.find(params[:id])
    end

    def gift_params
      params.require(:gift).permit(:title, :description, :category, :how_to_give, :price, :status,{ images: [] })
    end
end
