Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show'
  get '/teams/:id/competitors', to: 'team_competitors#index'
  get '/competitors', to: 'competitors#index'
  get '/competitors/:id', to: 'competitors#show'
end
