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
  attendant = Attendant.new(params)
  attendant.save
redirect to("/members")
end
