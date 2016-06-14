require 'sinatra/base'

class Bookmark < Sinatra::Base
  get '/' do
    'Hello Bookmark!'
  end


  run! if app_file == $0
end
