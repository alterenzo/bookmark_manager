class Bookmarks < Sinatra::Base

  get '/tags/:tag_name' do
    tag = Tag.first(name: params[:tag_name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

end
