require 'pg'

class Bookmark
	attr_reader :id, :title, :url

	def initialize(id:, title:, url:)
		@id = id
		@title = title
		@url = url
	end

	def self.all
		bookmark_arr = []
		if ENV['ENVIRONMENT'] == 'test'
			connection = PG.connect :dbname => 'bookmark_manager_test'
		else
			connection = PG.connect :dbname => 'bookmark_manager'
		end


		result = connection.exec("SELECT * FROM bookmarks")
	  result.map do |bookmark|
	    Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
		end

	end

	def self.add(url:, title:)
		if ENV['ENVIRONMENT'] == 'test'
    	connection = PG.connect(dbname: 'bookmark_manager_test')
  	else
    	connection = PG.connect(dbname: 'bookmark_manager')
  	end
		result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
	  Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
	end

	def self.delete(id:)
		if ENV['ENVIRONMENT'] == 'test'
			connection = PG.connect(dbname: 'bookmark_manager_test')
		else
			connection = PG.connect :dbname => 'bookmark_manager'
		end
    connection.exec("DELETE FROM bookmarks WHERE id = '#{id}'")
	end

	def self.update(id, url, title)
		connection = connect_database
		connection.exec("UPDATE bookmarks SET url='#{url}', title='#{title}' WHERE id='#{id}'")
	end

private
	def self.connect_database
		if ENV['ENVIRONMENT'] == 'test'
			PG.connect(dbname: 'bookmark_manager_test')
		else
			PG.connect :dbname => 'bookmark_manager'
		end
	end
end
