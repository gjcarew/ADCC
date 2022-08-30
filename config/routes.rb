Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  post '/teams', to: 'teams#create'
  get '/teams/:id', to: 'teams#show'
  patch '/teams/:id', to: 'teams#update'
  delete '/teams/:id', to: 'teams#delete'
  get '/teams/:id/edit', to: 'teams#edit'
  get '/teams/:id/competitors', to: 'team_competitors#index'
  get '/teams/:id/competitors/new', to: 'team_competitors#new'
  post '/teams/:id/competitors', to: 'team_competitors#create'
  get '/competitors', to: 'competitors#index'
  get '/competitors/:id', to: 'competitors#show'
  get '/competitors/:id/edit', to: 'competitors#edit'
  patch '/competitors/:id', to: 'competitors#update'
  delete '/competitors/:id', to: 'competitors#delete'
end
