#!/usr/bin/ruby

require 'pg'

begin

    con = PG.connect :dbname => 'bookmark_manager', :user => 'loureade'

    rs = con.exec "SELECT * FROM bookmarks"

    rs.each do |row|
      puts "%s %s" % [ row['id'], row['url']]
    end

rescue PG::Error => e

    puts e.message 

ensure

    rs.clear if rs
    con.close if con

end
