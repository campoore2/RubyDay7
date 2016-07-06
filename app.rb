require('sinatra')
require('sinatra/reloader')
require('./lib/task')
require('./lib/places')

also_reload('lib/**/*.rb')

get('/') do
  @page_title = "home"
  erb(:index)
end

get('/tasks') do
  @page_title = "tasks"
  erb(:tasks)
end

get('/tasks/:clear') do | clear_val |
  @page_title = "tasks"
  Task.clear()
  erb(:tasks)
end

post('/tasks') do
  @page_title = "tasks"
  Task.new(params.fetch("description")).save()
  @results = Task.all()
  erb(:tasks)
end

get ('/places') do
  @page_title = "places"
  erb(:places)
end

get('/places/:clear') do | clear_val |
  @page_title = "places"
  Places.clear()
  erb(:places)
end

post('/places') do
  @page_title = "places"
  @test = params.fetch("description")
  Places.new(params.fetch("description")).save()
  @results = Places.all()
  erb(:places)
end
