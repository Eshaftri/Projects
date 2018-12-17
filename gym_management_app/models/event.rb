class Event

  attr_reader :id
  attr_accessor(:event_type, :event_date, :event_time, :event_size)

  def initialize(options )
    @id = options['id'].to_i
    @event_type = options['event_type']
    @event_date = options['event_date']
    @event_time = options['event_time']
    @event_size = options['event_size'].to_i
  end

  def save()
    sql = "INSERT INTO events ( event_type, event_date, event_time, event_size) VALUES ( $1, $2, $3, $4 ) RETURNING *"
    values = [@event_type, @event_date, @event_time, @event_size]
    member = SqlRunner.run(sql, values).first
    @id = member['id'].to_i
  end

  def update()
    sql = "UPDATE events SET (event_type, event_date, event_time, event_size) =  ( $1, $2, $3, $4 )  WHERE id = $5"
    values = [@event_type, @event_date, @event_time, @event_size, @id]
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

  #Helper methods for mapping
  def self.map_items(event_data)
    result = event_data.map { |event| Event.new( event ) }
    return result
  end

end
