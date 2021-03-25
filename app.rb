require 'sinatra/base'
require './lib/bookmarks'

class BookmarksManager < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
  	@bookmarks = Bookmarks.all
    @new_title = params[:new_title]
    erb(:bookmarks)
  end

  post '/add_bookmark' do
   Bookmarks.add(url: params[:new_bookmark], title: params[:new_title])
   @new_title = params[:new_title]
   @new_bookmark = Bookmarks.all.last
  #  erb(:add_bookmark)
   redirect '/bookmarks'
  end

  # get '/add_bookmark' do
  #   erb(:add_bookmark)
  # end

  run! if app_file == $0
end
