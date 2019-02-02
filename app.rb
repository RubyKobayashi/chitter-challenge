require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    "Chitter"
  end

  get '/chitter' do
    @peep = session[:peep]
    erb :'chitter/index'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  post '/chitters' do
    session[:peep] = params[:peep]
    redirect '/chitter'
  end

end
