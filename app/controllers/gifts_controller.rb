class GiftsController < ApplicationController
  before_action :set_current_user_gift, only: %i[ edit update destroy ]

  def index
    @gifts = Gift.all.includes(:user)
  end

  def show
    @gift = Gift.find(params[:id])
  end

  def new
    @gift = current_user.gift.new
  end

  def edit
  end

  def create
    @gift = current_user.gifts.new(gift_params)
    if @gift.save
      flash[:success] = 'success'
      redirect_to gifts_path
    else
      flash.now[:danger] = 'failed'
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
    redirect_to gifts_path
  end

  private
  
    def set_current_user_gift
      @gift = current_user.gifts.find(params[:id])
    end

    def gift_params
      params.require(:gift).permit(:title, :description, :category, :how_to_give, :price, :status)
    end
end
