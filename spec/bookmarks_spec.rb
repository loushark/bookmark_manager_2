require 'bookmarks.rb'

describe Bookmarks do
	describe '.all' do
		it 'returns all bookmarks' do
			connection = PG.connect(dbname: 'bookmark_manager_test')

		Bookmarks.add(url:'http://www.makersacademy.com', title:"Makers")
    	Bookmarks.add(url:'http://www.destroyallsoftware.com', title:"Random")
    	Bookmarks.add(url:'http://www.google.com', title:"Google")

			bookmarks = Bookmarks.all

			expect(bookmarks).to include({:title=>"Makers", :url=>"http://www.makersacademy.com"})
			expect(bookmarks).to include({:title=>"Random", :url=>"http://www.destroyallsoftware.com"})
			expect(bookmarks).to include({:title=>"Google", :url=>"http://www.google.com"})
		end
	end

	describe '#add' do
		it 'add new bookmark to database'  do
			connection = PG.connect(dbname: 'bookmark_manager_test')
			Bookmarks.add(url: "http://www.makersacademy.com", title:"Makers")
			bookmarks = Bookmarks.all
			expect(bookmarks).to include({:title=>"Makers", :url=>"http://www.makersacademy.com"})
		end
	end

	 describe '#delete' do
		it 'deletes an existing bookmark' do
		  connection = PG.connect(dbname: 'bookmark_manager_test')
		  Bookmarks.add(url: "http://www.makersacademy.com", title:"Makers")
		  Bookmarks.delete(deleted_title: "Makers")
		  bookmarks = Bookmarks.all
		  expect(bookmarks).to_not include({:title=>"Makers", :url=>"http://www.makersacademy.com"})
		end
	end
end
