class EventsController < ApplicationController

  def new
    @statuses = Status.all
    @event = Event.new
  end

  def create
    @status = Status.find(params[:status_id])
    @event = @status.events.new(event_params)

    if @event.save
      flash[:notice] = "Event successfully created"
    else
      flash[:error] = "Unable to create event"
    end
    redirect_to root_path
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    @statuses = Status.all
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)

    if event.save
      flash[:notice] = "Event updated"
    else
      flash[:error] = "Unable to update event"
    end

    redirect_to event
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :active_at, :status_id, :resolved_at, :aasm_state)
  end
end