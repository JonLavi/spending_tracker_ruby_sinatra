require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

#Show all Tags
get '/tags' do
  @tags = Tag.all()
  erb ( :"tags/index" )
end

#Create new Tag
get '/tags/new' do
  erb ( :"tags/new" )
end

post '/tags' do
  new_tag = Tag.new(params)
  new_tag.save()
  redirect to("/tags")
end

#Show Tag details
get '/tags/:id' do
  @tag = Tag.find(params['id'].to_i)
  erb( :"tags/show" )
end

#Edit Tag details
get '/tags/:id/edit' do
  @tag = Tag.find(params['id'].to_i)
  erb(:'tags/edit')
end

post '/tags/:id' do
  @tag = Tag.new(params)
  @tag.update()
  erb(:'tags/show')
end

#Delete Tag route
get '/tags/:id/delete' do
  Tag.delete_by_id(params['id'].to_i)
  redirect to("/tags")
end
