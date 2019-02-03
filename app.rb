require 'sinatra/base'
require './lib/peep'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    "Chitter"
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :'chitter/index'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  post '/chitters' do
    # p params[:peep]
    peep = Peep.create(peep: params[:peep])
    redirect '/chitter'
  end

end
