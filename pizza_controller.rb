require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require('pry')

require_relative( './models/pizza_order' )
also_reload( './models/*' )

#index
get('/pizza-orders') do
  @pizzas = PizzaOrder.all()
  erb(:index)
end

#NEW
get ('/pizza-orders/new') do
  erb(:new)
end

#EDIT
get ('/pizza-orders/:id/edit') do
  # id = params[:id].to_i
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# UPDATE
post("/pizza-orders/:id") do
  @pizza = PizzaOrder.new(params).update
  redirect to "pizza-orders"
end

#SHOW
get('/pizza-orders/:id') do
  id = params[:id].to_i
  @pizza = PizzaOrder.find(id)
  erb(:show)
end

#CREATE
post('/pizza-orders') do
  @pizza = PizzaOrder.new(params)
  @pizza.save()
  erb(:create)
end

# DELETE
post('/pizza-orders/:id/delete') do
  id = params[:id].to_i
  @pizza = PizzaOrder.find(id)
  @pizza.delete()
  redirect to '/pizza-orders'
end
