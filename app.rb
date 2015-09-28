require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cd')
require('./lib/album')
require('pry')

get('/') do
  erb(:index)
end

get('/cds/new') do
  erb(:cds_form)
end

get('/cds') do
  @cds = Cd.all()
  erb(:cds)
end

post('/cds') do
  artist = params.fetch('artist')
  @cd = Cd.new(artist)
  @cd.save()
  @cds = Cd.all()
  erb(:success)
end

get('/albums/:id') do
  @album = Album.find(params.fetch('id').to_i())
  erb(:album)
end



get('/cds/:id') do
  @cd = Cd.find(params.fetch('id').to_i())
  erb(:cd)
end

get('/cds/:id/albums/new') do
  @cd = Cd.find(params.fetch('id').to_i())
  erb(:cd_albums_form)
end

get('/cds/:id/albums') do
  @id = params.fetch('id').to_i()
  @cd = Cd.find(@id)
  @albums = @cd.titles
  erb(:albums)
end


post('/albums') do
  name = params.fetch('name')
  year = params.fetch('year')
  @album = Album.new(name, year)
  @album.save()
  @cd = Cd.find(params.fetch('cd_id').to_i())
  @cd.add_album(@album)
  erb(:success)
end
