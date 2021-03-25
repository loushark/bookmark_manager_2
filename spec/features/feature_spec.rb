require './app.rb'
require 'spec_helper'

# feature 'index page' do
#   scenario 'index page exists' do
#     visit '/'
#     expect(page).to have_content("hello world!")
#   end
# end

feature 'bookmarks page' do
  scenario 'exists' do
    visit '/bookmarks'
    expect(page).to have_content("Bookmarks:")
  end

  scenario 'shows bookmarks' do
    clear_and_pop_db
  end
end

feature 'add new bookmark' do
  scenario 'form to fill name of new bookmark' do
    visit  ('/')
    expect(page).to have_field ('new_bookmark')
  end

  scenario 'form to fill name of new title' do
    visit  ('/')
    expect(page).to have_field ('new_title')
  end

  scenario 'see new bookmark title on /new_bookmark page' do
    visit  ('/')
    fill_in 'new_bookmark', with: 'https://http.cat'
    fill_in 'new_title', with: 'http cats'
    click_on 'New bookmark'
    expect(page).to have_content('http cats')
  end
end

  feature 'shows bookmarks' do
    scenario 'show existing bookmarks' do
      visit  ('/')
      expect(page).to have_button ('show_bookmarks')
    end
  end

  feature 'delete a bookmark'do
    scenario 'user can delete a bookmark' do
      clear_and_pop_db
       first('.bookmark').click_button 'delete'
      expect(page).not_to have_content("Makers")
    end
end
