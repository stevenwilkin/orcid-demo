require 'omniauth-orcid'
require 'sinatra'

class OrcidDemo < Sinatra::Base
  enable :sessions

  use OmniAuth::Builder do
    provider :orcid, ENV['ORCID_CLIENT_ID'], ENV['ORCID_CLIENT_SECRET'], sandbox: true
  end

  get '/' do
    erb :index
  end

  get '/auth/orcid/callback' do
    session[:omniauth] = request.env['omniauth.auth']
    redirect '/'
  end
end

