require 'sinatra/base'
require './lib/bookmarks'

class BookmarksManager < Sinatra::Base

  enable :method_override

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
  	@bookmarks = Bookmarks.all
    @new_title = params[:new_title]
    erb(:bookmarks)
  end

  # post '/bookmarks' do
  #   Bookmarks.delete(params[:title])
  #   redirect '/bookmarks'
  # end

  post '/add_bookmark' do
   Bookmarks.add(url: params[:new_bookmark], title: params[:new_title])
   @new_title = params[:new_title]
   @new_bookmark = Bookmarks.all.last
  #  erb(:add_bookmark)
   redirect '/bookmarks'
  end

  # post '/delete_bookmark' do
  #   redirect '/delete_bookmark'
  # end

  delete '/bookmarks/:title' do
    Bookmarks.delete(deleted_title: params[:title])
    redirect '/bookmarks'
  end
  #
  # get '/delete_bookmark' do
  #   erb(:delete_bookmark)
  # end

  run! if app_file == $0
end
