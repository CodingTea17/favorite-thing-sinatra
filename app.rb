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
  if !Item.check_dup_name(name) and !Item.check_dup_rank(rank)
    item = Item.new(name,rank)
    item.save()
  else
    @duplicate_error = "thing"
  end
  @list = Item.sort
  erb(:list)
end

get('/update/:id') do
  @the_chosen_one = Item.find(params[:id])
  erb(:update)
end

post('/update/:id') do
  name = params["name"]
  rank = params["rank"]

  backup_name = Item.find(params[:id]).name
  backup_rank = Item.find(params[:id]).rank

  Item.find(params[:id]).name = ""
  Item.find(params[:id]).rank = ""

  if !Item.check_dup_name(name) and !Item.check_dup_rank(rank)
    Item.find(params[:id]).name = name
    Item.find(params[:id]).rank = rank
  else
    Item.find(params[:id]).name = backup_name
    Item.find(params[:id]).rank = backup_rank
    @duplicate_error = "thing"
  end

  @list = Item.sort
  erb(:list)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  erb(:item)
end
