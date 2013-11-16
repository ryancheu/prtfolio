SaylorpAnuhyagIsabellatrombaRyancheuFinal::Application.routes.draw do
  
  resources :portfolios
  resources :templates
  resources :themes
  resources :resources
  resources :blocks
  resources :projects
  resources :users
  resources :sessions


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'pages#home'
  match '/signout', to: 'sessions#destroy',    via: 'delete'

  # redirect signin to github auth
  get '/signin', to: redirect('/auth/github')
  # capture the github callback path
  get '/auth/github/callback', to: 'sessions#create'
  
end
