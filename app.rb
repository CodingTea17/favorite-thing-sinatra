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
  n = params["name"]
  r = params["rank"]
  if Item.all.length > 0
    Item.all.each do |i|
      if i.name.downcase == n.downcase
        puts "the name same"
        @duplicate_error = "name"
        break
      else
        if i.rank == r
          @duplicate_error = "rank"
          break
        else
          puts "else"
          item = Item.new(n,r)
          item.save()
          break
        end
      end
    end
  else
    item = Item.new(n,r)
    item.save()
  end
  @list = Item.sort
  erb(:list)
end

get('/update/:id') do
  @the_chosen_one = Item.find(params[:id])
  erb(:update)
end

post('/update/:id') do
  n = params["name"]
  r = params["rank"]

  Item.find(params[:id]).name = n
  Item.find(params[:id]).rank = r

  @list = Item.sort
  erb(:list)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  erb(:item)
end
