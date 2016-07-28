class CommentsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @comment = Comment.new
  end

  def create
    
    event = Event.find(params[:event_id])
    comment = event.comments.new(comment_params)

    if comment.save
      flash[:notice] = "Comment successfully created"
    else
      flash[:error] = "Unable to create comment"
    end
    redirect_to event
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :event_id)
  end
end