require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )


#Show all Transactions
get '/transactions' do
  @budget = Budget.find(1)
  @transactions = Transaction.all()
  erb ( :"transactions/index" )
end

#Create new Transaction
get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb ( :"transactions/new" )
end

post '/transactions' do
  new_transaction = Transaction.new(params)
  new_transaction.save()
  redirect to("/transactions")
end

#Show Transaction details
get '/transactions/:id' do
  @transaction = Transaction.find(params['id'].to_i)
  erb( :"transactions/show" )
end

#Edit Transaction details
get '/transactions/:id/edit' do
  @transaction = Transaction.find(params['id'].to_i)
  erb(:'transactions/edit')
end

post '/transactions/:id' do
  @transaction = Transaction.new(params)
  @transaction.update()
  erb(:'transactions/show')
end

#Delete Transaction route
get '/transactions/:id/delete' do
  Transaction.delete_by_id(params['id'].to_i)
  redirect to("/transactions")
end
