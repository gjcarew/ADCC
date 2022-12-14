# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

Competitor.destroy_all
Team.destroy_all

atos = Team.create!(name: "Atos", head_coach: "Andre Galvao", year_founded: 2008, is_brazilian: true)
new_wave = Team.create!(name: "New Wave Jiu Jitsu", head_coach: "John Danaher", year_founded: 2021, is_brazilian: false)
chris_rees = Team.create!(name: "Chris Rees JJ", head_coach: "Chris Rees", year_founded: 2012, is_brazilian: false)
ecjja = Team.create!(name: 'East Coast Jiu Jitsu', head_coach: "Darragh O'Conaill", year_founded: 2017, is_brazilian: false)
aoj = Team.create!(name: 'Art of Jiu Jitsu', head_coach:'Rafael Mendes', year_founded: 2012, is_brazilian: true)
tenthplanet = Team.create!(name: "10th Planet", head_coach: 'Eddie Bravo', year_founded: 2003, is_brazilian: false)
fight_sports = Team.create!(name: 'Fight Sports', head_coach: 'Roberto Abreu', year_founded: 2011, is_brazilian: true)
absolute = Team.create!(name: "Absolute MMA Academy", head_coach: 'Lachlan Giles', year_founded: 2014, is_brazilian: false)
alliance = Team.create!(name: 'Alliance', head_coach: 'Romero Cavalcanti', year_founded: 1993, is_brazilian: true)
essential = Team.create!(name: 'Essential BJJ', head_coach: 'JT Torres', year_founded: 2018, is_brazilian: false)
b_team = Team.create!(name: 'B-Team', head_coach: 'Craig Jones', year_founded: 2021, is_brazilian: false)
marcelo= Team.create!(name: 'Marcelo Garcia Academy', head_coach: 'Marcelo Garcia', year_founded: '2009', is_brazilian: true)
gracie = Team.create!(name: 'Gracie Barra', head_coach: 'Carlos Gracie Jr', year_founded: 1986, is_brazilian: true)

chris_rees.competitors.create!(name: 'Ashley Williams', weight_class: 66, previous_winner: false)
ecjja.competitors.create!(name: 'Sam McNally', weight_class: 66, previous_winner: false)
aoj.competitors.create!(name: 'Cole Abate', weight_class: 66, previous_winner: false)
tenthplanet.competitors.create!(name: 'Keith Krikorian', weight_class: 66, previous_winner: false)
fight_sports.competitors.create!(name: 'Diogo Reis', weight_class: 66, previous_winner: false)
fight_sports.competitors.create!(name: 'Fabricio Andrey', weight_class: 66, previous_winner: false)
absolute.competitors.create!(name: 'Jeremy Skinner', weight_class: 66, previous_winner: false)
alliance.competitors.create!(name: 'Kennedy Maciel', weight_class: 66, previous_winner: false)
essential.competitors.create!(name: 'JT Torres', weight_class: 77, previous_winner:true)
atos.competitors.create!(name: 'Kade Ruotolo', weight_class: 77, previous_winner: false)
fight_sports.competitors.create!(name: 'Micael Galvao', weight_class: 77, previous_winner: false)
absolute.competitors.create!(name: 'Lachlan Giles', weight_class: 77, previous_winner: false)
b_team.competitors.create!(name: 'Nicky Ryan', weight_class: 77, previous_winner: false)
alliance.competitors.create!(name: 'Lucas Lepri', weight_class: 77, previous_winner:false)
atos.competitors.create!(name: 'Davi Ramos', weight_class: 77, previous_winner: true)
tenthplanet.competitors.create!(name: 'PJ Barch', weight_class: 77, previous_winner:false)
new_wave.competitors.create!(name: 'Giancarlo Bodoni', weight_class: 88, previous_winner:false)
b_team.competitors.create!(name: 'Jacob Rodriguez', weight_class: 88, previous_winner: false)
atos.competitors.create!(name: 'Alexandre de Jesus', weight_class: 88,previous_winner: false)
atos.competitors.create!(name: 'Josh Hinger', weight_class: 88, previous_winner: false)
atos.competitors.create!(name: 'Tye Ruotolo', weight_class: 88, previous_winner: false)
atos.competitors.create!(name: 'Lucas Barbosa', weight_class: 88, previous_winner: false)
b_team.competitors.create!(name: 'Izaak Michell', weight_class: 88, previous_winner: false)
gracie.competitors.create!(name: 'Pedro Marinho', weight_class: 88, previous_winner: false)
new_wave.competitors.create!(name: 'Luke Griffith', weight_class: 99, previous_winner: false)
fight_sports.competitors.create!(name: 'Joao Costa', weight_class: 99, previous_winner: false)
tenthplanet.competitors.create!(name: 'Kyle Boehm', weight_class: 99, previous_winner: false)
alliance.competitors.create!(name: 'Vinicius Ferreira', weight_class: 99, previous_winner:false)
atos.competitors.create!(name: 'Kaynan Duarte', weight_class: 99, previous_winner: true)
new_wave.competitors.create!(name: 'Nicholas Meregali', weight_class: 99, previous_winner: false)
b_team.competitors.create!(name: 'Craig Jones', weight_class: 99, previous_winner: false)
alliance.competitors.create!(name: 'Paul Ardila', weight_class: 99, previous_winner: false)
new_wave.competitors.create!(name: 'Dan Manasoiu', weight_class: 100, previous_winner: false)
fight_sports.competitors.create!(name: 'Roosevelt Sousa', weight_class: 100, previous_winner: false)
new_wave.competitors.create!(name: 'Gordon Ryan', weight_class: 100, previous_winner: true)
b_team.competitors.create!(name: 'Nick Rodriguez', weight_class: 100, previous_winner: false)
gracie.competitors.create!(name: 'Felipe Pena', weight_class: 100, previous_winner: true)
alliance.competitors.create!(name: 'Joao Gabriel Rocha', weight_class: 100, previous_winner: false)
fight_sports.competitors.create!(name: 'Roberto Abreu', weight_class: 100, previous_winner: true)
tenthplanet.competitors.create!(name: 'Vinny Magalhaes', weight_class: 100, previous_winner: true)
