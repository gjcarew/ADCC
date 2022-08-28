# [ ] done

# User Story 12, Parent Update 

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe 'edit teams' do
  describe 'as a visitor' do
    describe 'when I visit a teams show page' do
      it 'There is a link to update the team' do
        team = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: true)
        visit "/teams/#{team.id}"

        click_button "Update #{team.name}"
        expect(current_path).to eq("/teams/#{team.id}/edit")
      end

      it 'can edit the team' do
        team = Team.create!(name: "Atoss", head_coach: "Galvao", year_founded: 2002, is_brazilian: false)
        
        visit "/teams/#{team.id}"
        expect(page).to have_content("Atoss")
        expect(page).to have_content("Galvao")
        expect(page).to have_content(2002)
        expect(page).to have_content("not from Brazil")
        
        visit "/teams/#{team.id}/edit"

        fill_in 'Name', with: 'Atos'
        fill_in 'Head coach', with: 'Andre Galvao'
        fill_in 'Year founded', with: 2008
        check :is_brazilian
        click_button "Update #{team.name}"

        expect(current_path).to eq("/teams/#{team.id}")
        expect(page).to have_content('Atos')
        expect(page).to have_content('Andre Galvao')
        expect(page).to have_content('2008')
        expect(page).to have_content('from Brazil')
      end
    end
  end
end
