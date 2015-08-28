require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get '/'  do	
  erb(:index)
end

get '/bands/' do
  @bands = Band.all()
  erb(:bands)
end	

post '/bands/new' do
  @band = Band.create({name: params['name']})
  redirect '/bands/'
end	

get '/band/:id' do
  @band = Band.find(params['id'].to_i())	
  erb(:band)	
end	

patch '/band/:id' do
  @band = Band.find(params['id'].to_i())
  @band.update({name: params['name']})
  redirect back
end 

post '/band/:id' do
  @band = Band.find(params['id'].to_i())
  @venue = Venue.create({title: params['title']})
  @band.venues.push(@venue)
  erb(:band)
end

delete '/bands/:id' do
  @band = Band.find(params['id'].to_i())
  @band.destroy()
  redirect '/bands/'
end 

get '/venues/' do
  @venues = Venue.all()
  erb(:venues)
end	

post '/venues/new' do
  @venue = Venue.create({title: params['title']})	
  redirect '/venues/'
end	






#Add a new ingredient to the list of existing ingredients (view post /recipe/:id)
#recipe.ingredients.push(new_ingredient)

#Ingredient.new({:recipe_ids = [recipe.id()]})
#create new ingredient and associate with recipe at the same time 

#recipe.ingredients.destroy(ingredient)
#remove an ingredient from a recipe 


#recipe.update({:ingredient_ids =>[ingredient.id()]})
#update all of a recipe's ingredients or ingredient's recipes