require 'rails_helper'

RSpec.describe 'teams show' do
  describe 'as a visitor' do
    describe 'When I visit /teams/:id' do
      it 'shows the team attributes' do
        team = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: false)
        visit "/teams/#{team.id}"
        expect(page).to have_content(team.name)
        expect(page).to have_content(team.head_coach)
        expect(page).to have_content(team.year_founded)
        expect(page).to have_content("not from Brazil")
      end
    end
  end
end