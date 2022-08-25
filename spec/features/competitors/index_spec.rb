require 'rails_helper'

RSpec.describe 'competitors index', type: :feature do
  # [ ] done

  # User Story 3, Child Index 
  
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:
  describe 'as a visitor' do
    describe 'when I visit /competitors' do
      it 'displays the names of the competitors' do
        team1 = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
        team2 = Team.create!(name: "B-team", head_coach: "Craig Jones", year_founded: 2021, is_brazilian: false)
        competitor = team1.competitors.create!(name: "Gordon Ryan", weight_class: 100, previous_winner: true, team_id: 1)
        competitor2 = team2.competitors.create!(name: "Nick Rodriguez", weight_class: 100, previous_winner: false, team_id: 2)
        visit '/competitors'
        expect(page).to have_content(competitor.name)
        expect(page).to have_content(competitor2.name)
      end

      it 'displays competitor attributes' do
        team1 = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
        team2 = Team.create!(name: "B-team", head_coach: "Craig Jones", year_founded: 2021, is_brazilian: false)
        competitor = team1.competitors.create!(name: "Gordon Ryan", weight_class: 100, previous_winner: true, team_id: 1)
        competitor2 = team2.competitors.create!(name: "Nick Rodriguez", weight_class: 100, previous_winner: false, team_id: 2)
        visit '/competitors'
        expect(page).to have_content("99+")
        expect(page).to have_content("has won ADCC before")
        expect(page).to have_content("has not won ADCC before")
      end
    end
  end
end
