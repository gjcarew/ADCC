require 'rails_helper'

RSpec.describe 'teams show' do
  # [ ] done

  # User Story 2, Parent Show 
  
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table
  it 'shows the team attributes' do
    team = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: false)
    visit "/teams/#{team.id}"
    expect(page).to have_content(team.name)
    expect(page).to have_content(team.head_coach)
    expect(page).to have_content(team.year_founded)
    expect(page).to have_content("not from Brazil")
  end

end