class ActiveEventsController < ApplicationController

  def index
    @active_events = []
    @pending_events = []

    Event.all.each do |event|

      if (event.status.resolved == false) && (event.active_at <= Time.now)
        @active_events << event
      elsif (event.status.resolved == false) && (event.active_at > Time.now)
        @pending_events << event
      end
    end

  end
end