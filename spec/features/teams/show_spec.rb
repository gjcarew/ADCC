require 'rails_helper'

RSpec.describe 'teams show' do
  describe 'as a visitor' do
    describe 'When I visit /teams/:id' do
      before :each do
        @atos = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: true)
        @atos.competitors.create!(name: 'Alexandre de Jesus', weight_class: 88,previous_winner: false)
        @atos.competitors.create!(name: 'Josh Hinger', weight_class: 88, previous_winner: false)
        @atos.competitors.create!(name: 'Tye Ruotolo', weight_class: 88, previous_winner: false)
        @atos.competitors.create!(name: 'Lucas Barbosa', weight_class: 88, previous_winner: false)
      end

      it 'shows the team attributes' do
        visit "/teams/#{@atos.id}"
        expect(page).to have_content(@atos.name)
        expect(page).to have_content(@atos.head_coach)
        expect(page).to have_content(@atos.year_founded)
        expect(page).to have_content("from Brazil")
      end

      it 'has a count of number of competitors' do
        visit "/teams/#{@atos.id}"

        expect(page).to have_content("Atos has 4 competitors at ADCC 2022")
      end

      it 'has a link to the team competitors index' do
        visit "/teams/#{@atos.id}"
        click_link "#{@atos.name} competitors"
        expect(current_path).to eq("/teams/#{@atos.id}/competitors")
      end

      it 'has a button to delete the team' do
        visit "/teams/#{@atos.id}"
        click_button "Delete Team"
        expect(current_path).to eq('/teams')
        expect(page).not_to have_content(@atos.name)
        visit('/competitors')
        expect(page).not_to have_content('Tye Ruotolo')
      end
    end
  end
end