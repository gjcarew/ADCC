require 'rails_helper'

RSpec.describe 'Competitors show' do
  describe 'As a visitor' do
    describe 'when I visit /competitors/:id' do
      it 'Then I see the competitor with that id including the competitor attributes' do
        team = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
        competitor = team.competitors.create!(name: "Gordon Ryan", weight_class: 100, previous_winner: true)
        visit "/competitors/#{competitor.id}"
        expect(page).to have_content(competitor.name)
        expect(page).to have_content("99+")
        expect(page).to have_content("has won ADCC before")
      end

      it 'There is a link to delete the competitor #Story 20, child delete' do
        team = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
        competitor = team.competitors.create!(name: "Gordon Ryan", weight_class: 100, previous_winner: true)
        competitor2 = team.competitors.create!(name: "Giancarlo Bodoni", weight_class: 88, previous_winner: true)
        visit "/competitors/#{competitor.id}"
        click_button 'Delete Competitor'
        expect(current_path).to eq('/competitors')
        expect(page).to have_content(competitor2.name)
        expect(page).not_to have_content(competitor.name)
      end
    end
  end
end