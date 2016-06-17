
class Bookmarks < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, "super secret"
  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) # doens't have to be an instance variable at this stage
    end
  end

  run! if app_file == $0
end
