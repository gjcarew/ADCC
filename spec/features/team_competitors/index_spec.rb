require 'rails_helper'

RSpec.describe 'team competitors' do
  describe 'as a visitor' do
    describe 'when I visit /teams/:team_id/competitors' do
      before :each do
        @team = Team.create!(name: "New Wave Jiu Jitsu",
                             head_coach: "John Danaher",
                             year_founded: 2021,
                             is_brazilian: false)
        @competitor = @team.competitors.create!(name: "Gordon Ryan",
                                                weight_class: 100,
                                                previous_winner: true)
        @competitor2 = @team.competitors.create!(name: "Giancarlo Bodoni",
                                                 weight_class: 88,
                                                 previous_winner: false)
      end
      it 'I see each child that is associated with that parent, with each childs attributes' do
        visit "/teams/#{@team.id}/competitors"
        
        expect(page).to have_content(@competitor.name)
        expect(page).to have_content(@competitor2.name)
        expect(page).to have_content("99+")
        expect(page).to have_content(@competitor2.weight_class)
        expect(page).to have_content("has won ADCC before")
        expect(page).to have_content("has not won ADCC before")
      end

      it 'I see a link to sort competitors in alphabetical order (story 16)' do
        visit "/teams/#{@team.id}/competitors"

        click_link 'Sort alphabetically'

        expect(all('.competitor-name')[0].text).to eq(@competitor2.name)
        expect(all('.competitor-name')[1].text).to eq(@competitor.name)
      end

      it 'Only displays competitors over a certain weight class' do
        visit "/teams/#{@team.id}/competitors"

        fill_in 'Threshold weight', with: '99'
        click_button 'Only return competitors with weight class over the threshold weight'

        expect(page).to have_content(@competitor.name)
        expect(page).not_to have_content(@competitor2.name)
      end
    end
  end
end
