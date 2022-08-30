require 'rails_helper'

RSpec.describe 'teams index' do
  describe 'As a visitor' do
    describe 'When I visit /teams' do
      it 'shows the names of the teams' do
        team = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: false)
        visit '/teams'
        expect(page).to have_content(team.name)
      end
    end

    describe 'User story 6 [ ] when I visit /teams' do
      it 'is ordered by recently created first' do
        team1 = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
        team2 = Team.create!(name: "B-team", head_coach: "Craig Jones", year_founded: 2021, is_brazilian: false)
        visit '/teams'
        expect(all('.team-name')[0].text).to eq(team1.name)
        expect(all('.team-name')[1].text).to eq(team2.name)
      end

      it 'shows when it was created on the page' do
        team1 = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
        team2 = Team.create!(name: "B-team", head_coach: "Craig Jones", year_founded: 2021, is_brazilian: false)
        visit '/teams'
        expect(page).to have_content(team1.created_at)
        expect(page).to have_content(team2.created_at)
      end
    end

    describe 'User story 8' do
      it 'has a link to go to the teams index on every page' do
        team1 = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
        team2 = Team.create!(name: "B-team", head_coach: "Craig Jones", year_founded: 2021, is_brazilian: false)

        visit '/competitors'
        click_link 'Teams'
        expect(current_path).to eq('/teams')
        visit "/teams/#{team1.id}"
        click_link 'Teams'
        expect(current_path).to eq('/teams')
      end
    end

    describe 'User story 17' do
      it 'has a link to edit parents info' do
        team1 = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
        team2 = Team.create!(name: "B-team", head_coach: "Craig Jones", year_founded: 2021, is_brazilian: false)
        visit '/teams'
        click_link "Edit #{team1.name}"
        expect(current_path).to eq("/teams/#{team1.id}/edit")
        visit '/teams'
        click_link "Edit #{team2.name}"
        expect(current_path).to eq("/teams/#{team2.id}/edit")
      end
    end

    describe 'User story 22' do
      it 'can delete a team from the team index page' do
        team1 = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
        team2 = Team.create!(name: "B-team", head_coach: "Craig Jones", year_founded: 2021, is_brazilian: false)
        visit '/teams'
        click_button 'Delete New Wave Jiu Jitsu'
        expect(current_path).to eq('/teams')
        expect(page).to have_content(team2.name)
        expect(page).not_to have_content(team1.name)
      end
    end
  end
end
