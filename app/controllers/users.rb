
require 'sinatra/base'

class BookmarkManager < Sinatra::Base


  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/links')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end


  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  get '/users/password_reset' do
    erb :'users/password_reset'
  end

  post '/users/password_reset' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
      flash.keep[:notice] = 'Please check your email for further instructions'
      redirect to('/sessions/new')
    else
      flash.keep[:notice] = 'Email not found, please re-enter your email.'
      redirect to('/users/password_reset')
    end
  end

end
