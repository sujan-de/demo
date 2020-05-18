class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comments_params)
    @event = @comment.event
    redirect_to @event
  end

  private

  def comments_params
    params.require(:comment).permit(:message, :user_id, :event_id)
  end
end
