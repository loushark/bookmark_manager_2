def clear_and_pop_db
  connection = PG.connect(dbname: 'bookmark_manager_test')

  Bookmarks.add('http://www.makersacademy.com', "Makers")
  Bookmarks.add('http://www.destroyallsoftware.com', "Random")
  Bookmarks.add('http://www.google.com', "Google")


 visit '/bookmarks'

 expect(page).to have_content("http://www.makersacademy.com")
 expect(page).to have_content("http://www.destroyallsoftware.com")
 expect(page).to have_content("http://www.google.com")
end

# Used this to kee feature test DRY. Maybe bteer way to do
# it keeping expect in features
