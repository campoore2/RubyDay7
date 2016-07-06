require('sinatra')
require('sinatra/reloader')
require('./lib/task')
require('./lib/places')
require('./lib/tamagotchi')

also_reload('lib/**/*.rb')

get('/') do
  @page_title = "home"
  erb(:index)
end

# Tamagotchi
get('/tamagotchi') do
  @page_title = "tamagotchi"
  @pets = Tamagotchi.all()
  erb(:tamagotchi)
end

post('/tamagotchi/new') do
  @page_title = "tamagotchi"
  @pet = Tamagotchi.new(params.fetch('name'))
  @pet.save()
  redirect to('/tamagotchi')
end

get('/tamagotchi/view/:pet') do
  @index = params['pet']
  @page_title = "tamagotchi"
  mypets = Tamagotchi.all()
  @pet = mypets[@index.to_i]
  erb(:tamagotchi_view)
end

get('/tamagotchi/edit/:pet/:action/') do
  action = params['action']
  pet_id = params['pet'].to_i
  temp_pet = Tamagotchi.all()
  @pet = temp_pet[pet_id]
  if action == 'food'
    @pet.feed()
  elsif action == 'sleep'
    @pet.sleep()
  else
    @pet.play()
    @pet.time_passes
    @pet.save()
  end
  redirect to("/tamagotchi/view/#{pet_id}")
end

# Tasks
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

# Places
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
