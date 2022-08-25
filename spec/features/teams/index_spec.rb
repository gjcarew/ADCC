require 'rails_helper'

RSpec.describe 'teams index' do
  # [ ] done

  # User Story 1, Parent Index 

  # For each parent table
  describe 'As a visitor' do
    describe'When I visit /teams' do
      it 'shows the names of the teams' do
        team = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: false)
        visit '/teams'
        expect(page).to have_content(team.name)
      end

      describe 'User story 6 [ ]' do
        before :each do
          @team1 = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
          @team2 = Team.create!(name: "B-team", head_coach: "Craig Jones", year_founded: 2021, is_brazilian: false)
          visit '/teams'
        end

        it 'is ordered by recently created first' do
          expect(all('.team-name')[0].text).to eq(@team1.name)
          expect(all('.team-name')[1].text).to eq(@team2.name)
        end

        it 'shows when it was created on the page' do
          expect(page).to have_content(@team1.created_at)
          expect(page).to have_content(@team2.created_at)
        end
      end
    end
  end

end
