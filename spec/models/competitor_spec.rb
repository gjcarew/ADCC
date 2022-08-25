require 'rails_helper'

RSpec.describe Competitor, type: :model do
  it 'exists' do
    team = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
    competitor = team.competitors.create!(name: "Gordon Ryan", weight_class: 100, previous_winner: true)
    expect(competitor).to be_a Competitor
  end

  it {should belong_to :team}

end