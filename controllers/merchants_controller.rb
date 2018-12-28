require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant.rb' )
also_reload( '../models/*' )

get '/merchants' do
  'Hello World'
  @merchants = Merchant.all()
  erb ( :"merchant/index" )
end

get '/victims/:id' do
  @victim = Victim.find(params['id'].to_i)
  erb( :"victims/show" )
end
