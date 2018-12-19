class Attendant

  attr_reader :id
  attr_accessor(:member_id, :event_id)

  def initialize(options)
    @id = options['id'].to_i
    @member_id = options['member_id'].to_i
    @event_id =options['event_id'].to_i
  end

  def save()
    sql = "INSERT INTO attendants ( member_id, event_id ) VALUES ( $1, $2 ) RETURNING *"
    values = [@member_id, @event_id]
    attenant = SqlRunner.run(sql, values).first
    @id = attenant['id'].to_i
  end

  def update()
    sql = "UPDATE attendants SET (member_id, event_id) =  ( $1, $2 )  WHERE id = $3"
    values = [@member_id, @event_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM attendants"
    attenant_data = SqlRunner.run(sql)
    return Attendant.map_items(attenant_data)
  end

  def self.delete_all()
    sql = "DELETE FROM attendants"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM attendants
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM attendants
    WHERE id = $1"
    values = [id]
    attendant = SqlRunner.run( sql, values )
    result = Attendant.new( attendant.first )
    return result
  end

  def event()
    sql = "SELECT * FROM events
    WHERE events.id = $1"
    values = [@event_id]
    event_data = SqlRunner.run(sql, values)
    result = Event.map_item(event_data)
    return result
  end

  #Helper methods for mapping
  def self.map_items(attenant_data)
    result = attenant_data.map { |attenant| Attendant.new( attenant ) }
    return result
  end

  def self.map_item(attenant_data)
    result = Attendant.map_items(attenant_data)
    return result.first
  end

end
