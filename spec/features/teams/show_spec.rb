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

      it 'has a count of number of competitors' do
        atos = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: true)
        atos.competitors.create!(name: 'Alexandre de Jesus', weight_class: 88,previous_winner: false)
        atos.competitors.create!(name: 'Josh Hinger', weight_class: 88, previous_winner: false)
        atos.competitors.create!(name: 'Tye Ruotolo', weight_class: 88, previous_winner: false)
        atos.competitors.create!(name: 'Lucas Barbosa', weight_class: 88, previous_winner: false)
        
        visit "/teams/#{atos.id}"

        expect(page).to have_content("Atos has 4 competitors at ADCC 2022")
      end
    end
  end
end