require 'rails_helper'

RSpec.describe 'the artist show page', type: :feature do 
    # User Story 3
    # As a user
    # When I visit an Artist's show page
    # Then I see the Artist's name
    # And I see the Artist's average song lenth
    # And I see the Artist's total song count
    it 'shows the Artist name, average song length, and song count' do 
        artist = Artist.create!(name: 'Carly Rae Jepsen') 
        song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234567)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)
        avg_length = (song.length + song_2.length)/2
        
        visit "/artist/#{artist.id}"
        save_and_open_page

        # capybara lets us use this language 
        expect(page).to have_content(artist.name)
        expect(page).to have_content(avg_length)
        expect(page).to have_content("2")
    end
end
    
    