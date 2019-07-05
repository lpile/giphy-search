require 'rails_helper'

feature 'user can search for tiger gifs' do
  scenario 'user submits tiger' do
    # As a user
    # When I visit "/"
    visit '/'

    # And I enter "tiger" in the search box
    fill_in :q, with: 'tiger'
    # and I click "Search"
    click_on 'Search'
    expect(current_path).to eq('/search')

    # Then my path should be /search with "q=tiger" in the parameters
    expect(current_url).to include('q=tiger')

    # And I should see "5 Results"
    expect(page).to have_content('5 Results')

    # And I should see an title, id, a url, and the gif.
    expect(page).to have_all_of_selectors('.gif-title', '.gif-id', '.gif-url', '.gif-gif')
  end
end
