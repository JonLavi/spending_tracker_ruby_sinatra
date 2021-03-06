require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

#Show all Transactions
get '/transactions' do
  @budget = Budget.find(1)
  @merchants = Merchant.all()
  @tags = Tag.all()
  @transactions = Transaction.all()
  erb ( :"transactions/index" )
end

#Filter by Merchant/Tag
post '/transactions/merchant' do
  @budget = Budget.find(1)
  @merchants = Merchant.all()
  @tags = Tag.all()
  @transactions = Transaction.all_by_merchant(params)
  erb ( :"transactions/index" )
end

post '/transactions/tag' do
  @budget = Budget.find(1)
  @merchants = Merchant.all()
  @tags = Tag.all()
  @transactions = Transaction.all_by_tag(params)
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
  @merchants = Merchant.all()
  @tags = Tag.all()
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
