class CommentsController < ApplicationController

  def create
    @gift = Gift.find(params[:gift_id])
    @comment = @gift.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
  end

  def edit
    @gift = Gift.find(params[:gift_id])
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:gift_id])
    @comment = current_user.comments.find(params[:id])
    @comment.gift_id = @gift.id
    @comment.update(comment_params)
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end

  def show
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
