class Attendant

  attr_accessor(:member_id, :event_id)

  def initialize(member_id,event_id)
    @member_id = member_id
    @event_id =event_id
  end

end
