require 'rails_helper'

RSpec.describe 'competitors index', type: :feature do
  describe 'as a visitor' do
    describe 'when I visit /competitors' do
      before :each do
        @team1 = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
        @team2 = Team.create!(name: "B-team", head_coach: "Craig Jones", year_founded: 2021, is_brazilian: false)
        @competitor = @team1.competitors.create!(name: "Gordon Ryan", weight_class: 100, previous_winner: true)
        @competitor2 = @team2.competitors.create!(name: "Nick Rodriguez", weight_class: 100, previous_winner: false)
        @competitor3 = @team2.competitors.create!(name: "SOmeone good", weight_class: 100, previous_winner: true)
        
      end

      it 'displays the names of the competitors' do
        visit '/competitors'
        expect(page).to have_content(@competitor.name)
        
      end

      it 'displays competitor attributes' do
        visit '/competitors'
        expect(page).to have_content("99+")
        expect(page).to have_content("has won ADCC before")
        
      end

      it 'has a link on every page to go to the competitor index' do
        visit '/teams'
        click_link 'Competitors'
        expect(current_path).to eq('/competitors')

        visit "/teams/#{@team1.id}"
        click_link 'Competitors'
        expect(current_path).to eq('/competitors')
      end

      it 'I only see records where previous_winner is true (story 15)' do
        visit '/competitors'

        expect(page).not_to have_content('has not won ADCC before')
      end

      it 'I can delete a competitor from the competitor index page' do
        visit '/competitors'
        click_button "Delete #{@competitor3.name}"
        expect(page).to have_content(@competitor.name)
        expect(page).not_to have_content(@competitor3.name)
      end
    end
  end
end
