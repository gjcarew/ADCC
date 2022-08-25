require 'rails_helper'

RSpec.describe Team, type: :model do
  it 'exists' do
    team = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: false)
    expect(team).to be_a Team
  end

  it {should have_many :competitors}

  it 'translates the is_brazilian bool into a string' do
    team = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: false)
    expect(team.is_brazilian_str).to eq("Atos is not from Brazil")
  end


end
