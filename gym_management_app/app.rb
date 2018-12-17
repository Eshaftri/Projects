require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/attendant_controller')
require_relative('controllers/event_controller')
require_relative('controllers/member_controller')

get '/' do
  erb( :index )
end
