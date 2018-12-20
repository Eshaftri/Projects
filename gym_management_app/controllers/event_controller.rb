require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/event.rb' )
also_reload( '../models/*' )

get '/events' do
  @events = Event.all() #show all
  erb (:"events/show")
end

get '/events/view' do
  @events = Event.all() #show all
  erb (:"events/view")
end

get '/events/new' do
  @event = Event.all
  erb(:"events/new")
end

post '/events' do #save
  event = Event.new(params)
  event.save
  redirect to("/events")
end

post '/events/:id/delete' do #delete
  Event.delete(params[:id])
  redirect to("/events")
end

get '/events/:id/edit' do # edit
  @event = Event.find( params[:id] )
  erb(:"events/edit")
end

post '/events/:id' do # update
  Event.new( params ).update
  redirect to '/events'
end
