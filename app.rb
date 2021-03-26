require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base

  enable :method_override

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
  	@bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  post '/add_bookmark' do
   Bookmark.add(url: params[:new_bookmark], title: params[:new_title])
   redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/update_bookmark' do
    @id = params[:id]
    erb(:update_bookmark)
  end

  patch '/bookmarks/:id' do
    Bookmark.update(params[:id], params[:update_url], params[:update_title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
