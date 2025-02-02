require 'bookmarks.rb'
require 'database_helpers'

describe Bookmark do

	describe '.all' do
		it 'returns all bookmarks' do
			connection = PG.connect(dbname: 'bookmark_manager_test')

   bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: "Makers Academy")
   Bookmark.add(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
   Bookmark.add(url: "http://www.google.com", title: "Google")

   bookmarks = Bookmark.all

   expect(bookmarks.length).to eq 3
   expect(bookmarks.first).to be_a Bookmark
   expect(bookmarks.first.id).to eq bookmark.id
   expect(bookmarks.first.title).to eq 'Makers Academy'
   expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
		end
end

		describe '.create' do
			it 'creates a new bookmark' do
	    bookmark = Bookmark.add(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
	    persisted_data = persisted_data(id: bookmark.id)

	    expect(bookmark).to be_a Bookmark
	    expect(bookmark.id).to eq persisted_data['id']
	    expect(bookmark.title).to eq 'Test Bookmark'
	    expect(bookmark.url).to eq 'http://www.testbookmark.com'
	  end
	end

	describe '#delete' do
		it 'deletes an existing bookmark' do
			bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')

    Bookmark.delete(id: bookmark.id)

    expect(Bookmark.all.length).to eq 0
		end
	end

	describe '.update' do
		it 'updates a bookmark entry' do
			connection = PG.connect(dbname: 'bookmark_manager_test')
			bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: "Makers")
			persisted_data = persisted_data(id: bookmark.id)
			# results = connection.exec("SELECT * FROM bookmarks")
			# array = []
			# results.map { |bookmark| array << bookmark }
			# puts array #{"id"=>"44", "url"=>"http://www.makersacademy.com", "title"=>"Makers"}

			Bookmark.update(persisted_data['id'],"http://www.makersacademy.com", 'Makers Academy')
			expect(connection.exec("SELECT * FROM bookmarks WHERE id='#{persisted_data['id']}'").first['title']).to eq 'Makers Academy'


		end
	end
end
