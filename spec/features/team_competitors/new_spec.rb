require 'rails_helper'

RSpec.describe "New Competitor" do
  describe 'as a visitor' do
    describe 'when I visit a team competitors index page' do 
      it 'I see a link to add a new competitor to that team' do
        atos = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: true)
        visit "/teams/#{atos.id}/competitors"
        click_link "Create Competitor"
        expect(current_path).to eq("/teams/#{atos.id}/competitors/new")
      end

      it 'can create a new competitor' do
        atos = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: true)
        visit "/teams/#{atos.id}/competitors/new"
        fill_in('Name', with: 'Lucas Barbosa')
        fill_in('Weight class', with: 88)
        choose('This competitor has not won ADCC before')
        click_button('Create Competitor')
        expect(current_path).to eq("/teams/#{atos.id}/competitors")
        expect(page).to have_content("Lucas Barbosa")
      end
    end
  end
end