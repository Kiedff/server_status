class CommentsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @comment = Comment.new
    @statuses = Status.all
  end

  def create
    event = Event.find(params[:event_id])
    event.status_id = params[:status_id]
    comment = event.comments.new(comment_params)
    event.updated_at = Time.now

    if comment.save && event.save
      flash[:notice] = "Comment successfully created"
    else
      flash[:error] = "Unable to create comment"
    end
    redirect_to event
  end

  def edit
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:id])
    @statuses = Status.all
  end

  def update
    event = Event.find(params[:event_id])
    event.status_id = params[:status_id]
    event.updated_at = Time.now

    comment = Comment.find(params[:id])
    comment.update(comment_params)
    

    if comment.save && event.save
      flash[:notice] = "Comment updated"
    else
      flash[:error] = "Unable to update comment"
    end
    redirect_to event
  end

  def destroy
    comment = Comment.find(params[:id])
    event = Event.find(params[:event_id])

    event.updated_at = Time.now

    if comment.destroy && event.save
      flash[:notice] = 'Comment deleted.'
    else
      flash[:error] = 'Unable to delete Comment'
    end

    redirect_to event

  end

  private

  def comment_params
    params.require(:comment).permit(:body, :event_id)
  end
end