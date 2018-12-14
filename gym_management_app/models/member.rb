class Member

  attr_accessor(:first_name, :last_name, :titel, :address, :dob)

  def initialize(first_name, last_name, titel, address, dob )
    @first_name = first_name
    @last_name = last_name
    @titel = titel
    @dob = dob
  end

end
