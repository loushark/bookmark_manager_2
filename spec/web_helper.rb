def clear_and_pop_db
  connection = PG.connect(dbname: 'bookmark_manager_test')

  Bookmarks.add(url:'http://www.makersacademy.com', title:"Makers")
  Bookmarks.add(url:'http://www.destroyallsoftware.com', title:"Random")
  Bookmarks.add(url:'http://www.google.com', title:"Google")


 visit '/bookmarks'

 expect(page).to have_content("Makers")
 expect(page).to have_content("Random")
 expect(page).to have_content("Google")
end

# Used this to kee feature test DRY. Maybe bteer way to do
# it keeping expect in features
