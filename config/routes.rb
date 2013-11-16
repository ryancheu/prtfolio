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

  root 'pages#home'
  match '/signout', to: 'sessions#destroy',    via: 'delete'

  # redirect signin to venmo auth
  get '/signin', to: redirect('/auth/github')
  # capture the venmo callback path
  get '/auth/github/callback', to: 'sessions#create'
  
end
