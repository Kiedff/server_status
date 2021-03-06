class EventsController < ApplicationController
  load_and_authorize_resource

  def new
    @statuses = Status.all
    @event = Event.new
  end

  def create

    #prevents breaking before validations when status id not supplied
    if params[:status_id] != ""
      @status = Status.find(params[:status_id])
      @event = @status.events.new(event_params)
    
      if @status.resolved
        event.resolved_at = Time.now
      end
    end

    @event.creator = current_user

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
    
    event.status_id = params[:status_id]

    if event.status.resolved
      event.resolved_at = Time.now
    end

    if event.save
      flash[:notice] = "Event updated"
    else
      flash[:error] = "Unable to update event"
    end

    redirect_to event
  end

  def index
    @events_array = []

    Event.all.each do |event|
      if event.status.resolved
        @events_array << event
      end
    end

    @resolved_events = @events_array.paginate(page: params[:page], per_page: 5)
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :active_at, :status_id, :resolved_at, :aasm_state, :creator_id)
  end
end