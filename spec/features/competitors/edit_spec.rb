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
  
  describe 'User story 18: child update from child index' do
    before :each do
      @team = Team.create!(name: "New Wave Jiu Jitsu",
        head_coach: "John Danaher",
        year_founded: 2021,
        is_brazilian: false)
      @competitor = @team.competitors.create!(name: "Gordon Ryan",
                                weight_class: 100,
                                previous_winner: true)
    end

    it 'There is a link to the edit page on the competitors index' do
      visit '/competitors'
      click_link "Edit #{@competitor.name}"
      expect(current_path).to eq("/competitors/#{@competitor.id}/edit")
    end

    it 'There is a link to the edit page on the parent child index page' do
      visit "/teams/#{@team.id}/competitors"
      click_link "Edit #{@competitor.name}"
      expect(current_path).to eq("/competitors/#{@competitor.id}/edit")
    end
  end
end