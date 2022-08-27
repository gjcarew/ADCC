require 'rails_helper'
# User Story 11, Parent Creation 

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
RSpec.describe 'Creating a new team' do
  describe 'as a visitor' do
    describe 'when I visit the teams index page' do
      it 'has a link to /teams/new' do
        visit '/teams'

        click_link('New Team')
        expect(current_path).to eq('/teams/new')
      end

      it 'can create a new team' do
        visit '/teams/new'

        fill_in('Name', with: 'New Wave Jiu Jitsu')
        fill_in('Head coach', with: 'John Danaher')
        fill_in('Year founded', with: 2021)
        click_button('Create Team')
        new_team_id = Team.last.id
        expect(current_path).to eq('/teams')
        expect(page).to have_content("New Wave Jiu Jitsu")
      end

    end
  end
end
