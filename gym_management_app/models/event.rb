class Event

  attr_accessor(:event_type, :event_date, :event_time, :event_size)

  def initialize(event_type, event_date, event_time, event_size )
    @event_type = event_type
    @event_date = event_date
    @event_time = event_time
    @event_size = event_size
  end

end
