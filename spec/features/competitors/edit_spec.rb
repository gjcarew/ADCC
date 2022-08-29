# # [ ] done

# # User Story 14, Child Update 

# # As a visitor
# # When I visit a Child Show page
# # Then I see a link to update that Child "Update Child"
# # When I click the link
# # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# # When I click the button to submit the form "Update Child"
# # Then a `PATCH` request is sent to '/child_table_name/:id',
# # the child's data is updated,
# # and I am redirected to the Child Show page where I see the Child's updated information
require 'rails_helper'

RSpec.describe 'Update competitor', type: :feature do
  describe 'As a visitor' do
    before :each do
      team1 = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
      @competitor = team1.competitors.create!(name: "Potluck Loudio", weight_class: 89, previous_winner: false)
    end

    it 'When I visit the Competitor Show page I see a link to update competitor' do
      visit "/competitors/#{@competitor.id}"
      click_button "Update Competitor"
      expect(current_path).to eq("/competitors/#{@competitor.id}/edit")
    end

    it 'I can edit the competitor' do
      visit "/competitors/#{@competitor.id}"
      expect(page).to have_content("Potluck Loudio")
      expect(page).to have_content("89")
      expect(page).to have_content("not won ADCC")
      
      visit "/competitors/#{@competitor.id}/edit"

      fill_in 'Name', with: 'Gordon Ryan'
      fill_in 'Weight class', with: '100'
      choose :previous_winner_true
      click_button "Update Competitor"

      expect(current_path).to eq("/competitors/#{@competitor.id}")
      expect(page).to have_content('Gordon Ryan')
      expect(page).to have_content('99+')
      expect(page).to have_content('has won ADCC before')
    end
  end
end