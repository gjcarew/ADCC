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

  it 'counts competitors on a team' do
    atos = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: true)
    atos.competitors.create!(name: 'Alexandre de Jesus', weight_class: 88,previous_winner: false)
    atos.competitors.create!(name: 'Josh Hinger', weight_class: 88, previous_winner: false)
    atos.competitors.create!(name: 'Tye Ruotolo', weight_class: 88, previous_winner: false)
    atos.competitors.create!(name: 'Lucas Barbosa', weight_class: 88, previous_winner: false)
    expect(atos.count).to eq(4)
  end

  it 'deletes all members of a team' do
    atos = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: true)
    atos.competitors.create!(name: 'Alexandre de Jesus', weight_class: 88,previous_winner: false)
    atos.competitors.create!(name: 'Josh Hinger', weight_class: 88, previous_winner: false)
    atos.competitors.create!(name: 'Tye Ruotolo', weight_class: 88, previous_winner: false)
    atos.competitors.create!(name: 'Lucas Barbosa', weight_class: 88, previous_winner: false)
    atos.delete_competitors
    expect(atos.competitors).to be_empty
  end

  it 'can filter by threshold weight' do
    atos = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: true)
    @xande = atos.competitors.create!(name: 'Alexandre de Jesus', weight_class: 88,previous_winner: false)
    @josh = atos.competitors.create!(name: 'Josh Hinger', weight_class: 88, previous_winner: false)
    @tye = atos.competitors.create!(name: 'Tye Ruotolo', weight_class: 88, previous_winner: false)
    @lucas = atos.competitors.create!(name: 'Lucas Barbosa', weight_class: 100, previous_winner: false)
    
    expect(atos.search_threshold_weight(90)).to eq([@lucas])
  end
end
