require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant.rb' )
also_reload( '../models/*' )

get '/merchants' do
  @merchants = Merchant.all()
  erb ( :"merchants/index" )
end

get '/merchants/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  erb(:"merchants/show")
end
