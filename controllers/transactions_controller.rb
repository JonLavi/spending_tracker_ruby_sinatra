require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )


get '/transactions' do
  @transactions = Transaction.all()
  erb ( :"transactions/index" )
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'].to_i)
  erb(:"transactions/show")
end
