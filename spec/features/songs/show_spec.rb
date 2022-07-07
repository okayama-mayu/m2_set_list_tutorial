require 'rails_helper'

RSpec.describe 'the songs show page', type: :feature do 
    # As a visitor 
    # When I visit /songs/1 (where 1 is the id of a song in my database)
    # Then I see that song's title, and artist 
    # And I do not see any other songs in my database 
    it 'displays the song title' do 
        artist = Artist.create!(name: 'Carly Rae Jepsen') 
        song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234567)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)
        
        visit "/songs/#{song.id}"

        # capybara lets us use this language 
        expect(page).to have_content(song.title)
        expect(page).to_not have_content(song_2.title)
    end 

    it 'displays the name of the artist for the song' do 
        artist = Artist.create!(name: 'Carly Rae Jepsen') 
        song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234567)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)
        
        visit "/songs/#{song.id}" 

        expect(page).to have_content(artist.name)
    end 

    it 'dipslays the length' do 
        artist = Artist.create!(name: 'Carly Rae Jepsen') 
        song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234567)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)
        
        visit "/songs/#{song.id}" 

        expect(page).to have_content(song.length)
    end

    it 'displays the play count' do
        artist = Artist.create!(name: 'Carly Rae Jepsen') 
        song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234567)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)
        
        visit "/songs/#{song.id}" 

        expect(page).to have_content(song.play_count)
    end

    # User Story 2 
    # As a user 
    # When I visit a Song show page 
    # I see a link back to the songs index page 
    # When I click this link
    # Then I am taken to the songs index
    it 'shows a link back to the index' do 
        artist = Artist.create!(name: 'Carly Rae Jepsen') 
        song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234567)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)
        
        visit "/songs/#{song.id}" 

        expect(page).to have_link("Songs Index")
    end

    it 'has a link that takes you back to the songs index' do 
        artist = Artist.create!(name: 'Carly Rae Jepsen') 
        song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234567)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)
        
        visit "/songs/#{song.id}" 
        click_link "Songs Index"

        expect(current_path).to eq('/songs')
        expect(page).to have_content("I Really Like You")
        expect(page).to have_content("Call Me Maybe")
    end
end 