require_relative( '../db/sql_runner' )


class Member

  attr_reader :id
  attr_accessor(:first_name, :last_name, :title, :address, :dob)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @title = options['title']
    @address = options['address']
    @dob = options['dob']
  end

  def events()
    sql = "SELECT e.* FROM events e INNER JOIN attendants a ON a.event_id = e.id WHERE a.member_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |event| Event.new(event) }
  end

  def attendants()
    sql = "SELECT * FROM attendants
    WHERE member_id = $1"
    values = [@id]
    results = SqlRunner.run( sql, values )
    return Attendant.map_item(results)
 end


  def save()
    sql = "INSERT INTO members ( first_name, last_name, title, address, dob ) VALUES ( $1, $2, $3, $4, $5 ) RETURNING *"
    values = [@first_name, @last_name, @title, @address, @dob]
    member = SqlRunner.run(sql, values).first
    @id = member['id'].to_i
  end

  def update()
    sql = "UPDATE members SET (  first_name, last_name, title, address, dob  ) =  ( $1, $2, $3, $4, $5  )  WHERE id = $6"
    values = [@first_name, @last_name, @title, @address, @dob, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM members"
    member_data = SqlRunner.run(sql)
    return Member.map_items(member_data)
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM members
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    member = SqlRunner.run( sql, values )
    result = Member.new( member.first )
    return result
  end

  def book_class(attenant)
    return unless events.event_caps > 0
    Attendant.new('member_id' => @id, 'event_id' => events.id).save()
    events.reduce_capacity()
  end

  def format_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

  #Helper methods for mapping
  def self.map_items(member_data)
    result = member_data.map { |member| Member.new( member ) }
    return result
  end

end
