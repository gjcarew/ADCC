require 'rails_helper'

RSpec.describe 'teams index' do
  # [ ] done

  # User Story 1, Parent Index 

  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'shows the names of the teams' do
    team = Team.create(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: false)
    visit '/teams/index'
  end
end
