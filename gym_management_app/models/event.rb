class Event

  attr_reader :id
  attr_accessor(:event_type, :event_date, :event_time, :event_caps)

  def initialize(options )
    @id = options['id'].to_i
    @event_type = options['event_type']
    @event_date = options['event_date']
    @event_time = options['event_time']
    @event_caps = options['event_caps'].to_i
  end

  def save()
    sql = "INSERT INTO events ( event_type, event_date, event_time, event_caps) VALUES ( $1, $2, $3, $4 ) RETURNING *"
    values = [@event_type, @event_date, @event_time, @event_caps]
    member = SqlRunner.run(sql, values).first
    @id = member['id'].to_i
  end

  def update()
    sql = "UPDATE events SET (event_type, event_date, event_time, event_caps) =  ( $1, $2, $3, $4 )  WHERE id = $5"
    values = [@event_type, @event_date, @event_time, @event_caps, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM events"
    event_data = SqlRunner.run(sql)
    return Event.map_items(event_data)
  end

  def self.delete_all()
    sql = "DELETE FROM events"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM events
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM events
    WHERE id = $1"
    values = [id]
    event = SqlRunner.run( sql, values )
    result = Event.new( event.first )
    return result
  end

  def reduce_capacity()
    @event_caps -= 1
    update()
  end

  #Helper methods for mapping
  def self.map_items(event_data)
    result = event_data.map { |event| Event.new( event ) }
    return result
  end

end
