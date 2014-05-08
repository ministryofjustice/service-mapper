class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comments_params)
    @comment.save!
    if request.xhr?
      render :partial => 'comments/comments', :locals => {:item => @comment.item}
    else
      redirect_to root_path
    end
  end

  private

  def comments_params
    params[:comment].permit(:item_type, :item_id, :comment)
  end
end
