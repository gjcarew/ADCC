# [ ] done

# User Story 13, Parent Child Creation 

# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
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
        click_button('Create Competitor')
        expect(current_path).to eq("/teams/#{atos.id}/competitors")
        expect(page).to have_content("Lucas Barbosa")
      end
    end
  end
end