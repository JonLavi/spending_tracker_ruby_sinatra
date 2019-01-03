require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')
require_relative('controllers/transactions_controller')
require_relative('models/budget')

get '/' do
  @budget = Budget.find(1)
  erb( :index )
end

post '/' do
  @budget = Budget.new(params)
  @budget.update()
  erb( :index )
end
