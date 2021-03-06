require 'sinatra/base'
require 'bart/station'

class Bartlby < Sinatra::Base

  set :public_dir, 'public'
  set :views, 'views'

  get '/' do
    @stations = Bart::Station::LIST
    erb :index
  end

  get '/realtime/:id' do |id|
    @station = Bart::Station.new(id)
    @station.load_departures
    erb :realtime
  end

end
