require_relative( "../models/member" )
require_relative( "../models/event.rb" )
require_relative( "../models/attendant.rb" )
require("pry-byebug")

Attendant.delete_all()
Event.delete_all()
Member.delete_all()

member1 = Member.new({
  "first_name" => "Adam",
  "last_name" => "Jones",
  "title" => "Mr",
  "address" => "st albans",
  "dob" => "20-09-85"
   })

member1.save()

member2 = Member.new({
  "first_name" => "Monika",
  "last_name" => "huserkova",
  "title" => "Ms",
  "address" => "gilmerton Road",
  "dob" => "13-12-90"
})

member2.save()

member3 = Member.new({
  "first_name" => "James",
  "last_name" => "pivo",
  "title" => "Mr",
  "address" => "colder Ave",
  "dob" => "01-03-79"
})

member3.save()

member4 = Member.new({
  "first_name" => "Paula",
  "last_name" => "Ford",
  "title" => "Miss",
  "address" => "Nelson St",
  "dob" => "29-08-2000"
})

member4.save()

event1 = Event.new({
  "event_type" => "Yoga",
  "event_date" => '2000-12-18',
  "event_time" => "11:00",
  "event_caps" => 3
})

event1.save()

event2 = Event.new({
  "event_type" => "Zumba",
  "event_date" => '1990-11-18',
  "event_time" => "17:10",
  "event_caps" => 3
})

event2.save()

event3= Event.new({
  "event_type" => "Jumping",
  "event_date" => '2010-12-18',
  "event_time" => "09:00",
  "event_caps" => 3
})

event3.save()

event4= Event.new({
  "event_type" => "Boxing",
  "event_date" => '2000-01-19',
  "event_time" => "15:00",
  "event_caps" => 3
})

event4.save()

attendant1= Attendant.new({
  "member_id" => member1.id,
  "event_id" => event1.id
})

attendant1.save()

attendant2= Attendant.new({
  "member_id" => member2.id,
  "event_id" => event2.id
})
attendant2.save()

attendant3= Attendant.new({
  "member_id" => member3.id,
  "event_id" => event3.id
})
attendant3.save()

attendant4= Attendant.new({
  "member_id" => member4.id,
  "event_id" => event4.id
})
attendant4.save()

