class ActiveEventsController < ApplicationController

  def index
    @active_events = []
    
    Event.all.each do |event|
      if event.status.resolved == false
        @active_events << event
      end
    end

  end
end