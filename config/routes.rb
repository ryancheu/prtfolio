SaylorpAnuhyagIsabellatrombaRyancheuFinal::Application.routes.draw do
  
  resources :portfolios
  resources :templates
  resources :themes
  resources :resources
  resources :blocks
  resources :projects
  resources :users
  resources :sessions, only: [:new, :create, :destroy]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'sessions#new'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

end
