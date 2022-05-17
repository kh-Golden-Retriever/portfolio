class GiftsController < ApplicationController
  before_action :set_gift, only: %i[ show edit update destroy ]

  # GET /gifts or /gifts.json
  def index
    @gifts = Gift.all
  end

  # GET /gifts/1 or /gifts/1.json
  def show
  end

  # GET /gifts/new
  def new
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts or /gifts.json
  def create
    @gift = Gift.new(gift_params)

  end

  # PATCH/PUT /gifts/1 or /gifts/1.json
  def update
  end

  # DELETE /gifts/1 or /gifts/1.json
  def destroy
    @gift.destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift
      @gift = Gift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gift_params
      params.require(:gifts).permit()
    end
end
