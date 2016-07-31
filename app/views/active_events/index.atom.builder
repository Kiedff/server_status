atom_feed do |feed|
  feed.title "active events"

  # @active_events isn't active record object so maximum method doesn't work, but using it on all events instead gives an update in feed when event is resolved
  feed.updated Event.all.maximum(:updated_at)

  @active_events.each do |active_event|
    feed.entry active_event do |entry|
      entry.title active_event.title
      entry.content active_event.content
      entry.author do |author|
        author.name active_event.creator.name
      end
    end
  end
end