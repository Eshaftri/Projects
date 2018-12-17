require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/members' do
  @members = Member.all() #show all
  erb ( :"members/show" )
end

get '/members/new' do
  @member = Member.all
  erb(:"members/new")
end

post '/members' do #save
  member = Member.new(params)
  member.save
  redirect to("/members")
end

post '/members/:id/delete' do #delete
  Member.delete(params[:id])
  redirect to("/members")
end

get '/members/:id/edit' do # edit
  @member = Member.find( params[:id] )
  erb(:"members/edit")
end

post '/members/:id' do # update
  Member.new( params ).update
  redirect to '/members'
end
