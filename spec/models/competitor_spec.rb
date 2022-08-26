require 'rails_helper'

RSpec.describe Competitor, type: :model do
  it 'exists' do
    team = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
    competitor = team.competitors.create!(name: "Gordon Ryan", weight_class: 100, previous_winner: true)
    expect(competitor).to be_a Competitor
  end

  it {should belong_to :team}

  it 'displays weight class as 99+ if a competitor is in the 100 kg weight class' do
    team = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
    competitor = team.competitors.create!(name: "Gordon Ryan", weight_class: 100, previous_winner: true)
    expect(competitor.weight).to eq("99+")
  end

  it 'turns the bool previous_winner? into a string for display' do
    team = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
    competitor = team.competitors.create!(name: "Gordon Ryan", weight_class: 100, previous_winner: true)
    expect(competitor.won_lost_str).to eq("Gordon Ryan has won ADCC before")
  end


end