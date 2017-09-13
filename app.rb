require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/item')
require('pry')

get('/') do
  @list = Item.all()
  erb(:list)
end

post('/') do
  name = params["name"]
  rank = params["rank"]
  # Item.all.each do |i|
  #   if i.name.downcase == name.downcase or i.rank
  #
  #   else
  #     item = Item.new(name)
  #     item.save()
  #   end
  # end
  item = Item.new(name, rank)
  item.save()
  @list = Item.sort
  erb(:list)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  erb(:item)
end
