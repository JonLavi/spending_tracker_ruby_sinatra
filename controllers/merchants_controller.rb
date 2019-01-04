require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant.rb' )
also_reload( '../models/*' )

#Show all Merchants
get '/merchants' do
  @merchants = Merchant.all()
  @transactions = Transaction.all()
  erb ( :"merchants/index" )
end

#Create new Merchant
get '/merchants/new' do
  erb ( :"merchants/new" )
end

post '/merchants' do
  new_merchant = Merchant.new(params)
  new_merchant.save()
  redirect to("/merchants")
end

#Show Merchant details
get '/merchants/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  erb( :"merchants/show" )
end

#Edit Merchant details
get '/merchants/:id/edit' do
  @merchant = Merchant.find(params['id'].to_i)
  erb(:'merchants/edit')
end

post '/merchants/:id' do
  @merchant = Merchant.new(params)
  @merchant.update()
  erb(:'merchants/show')
end

#Delete Merchant route
get '/merchants/:id/delete' do
  Merchant.delete_by_id(params['id'].to_i)
  redirect to("/merchants")
end
