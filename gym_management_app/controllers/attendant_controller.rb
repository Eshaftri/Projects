require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/attendant.rb' )
require_relative( '../models/event.rb' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/attendants' do
  @members = Member.all
  @events = Event.all
  erb(:"attendants/new")
end

post '/attendants' do
  event = Event.find(params['event_id'])
  member = Member.find(params['member_id'])
  if !event.is_full?
    event.book_class()
    attendant = Attendant.new(params)
    attendant.save
    redirect to("/members")
  else
    redirect to("/attendants/error")
  end
end

get '/attendants/error' do
  erb(:'attendants/error')
end

get '/attendants/:id' do
  @event = Event.find(params['id'].to_i)
  erb(:"attendants/show")
end

post '/attendants/:id/delete' do #delete
  @attendant = Attendant.find(params['id'])


  @attendant.event.cancel_class()
  # binding.pry
  Attendant.delete(params[:id])
  redirect to("/events")
end
