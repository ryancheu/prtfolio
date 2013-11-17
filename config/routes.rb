SaylorpAnuhyagIsabellatrombaRyancheuFinal::Application.routes.draw do
    
  resources :users
  resources :sessions
  resources :portfolios

  resources :projects do
    resources :blocks
  end

  resources :templates
  resources :themes

  resources :codes
  resources :descriptions
  resources :videos
  resources :images

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'pages#home'
  match '/signout', to: 'sessions#destroy',    via: 'delete'

  # redirect signin to github auth
  get '/signin', to: redirect('/auth/github')
  # capture the github callback path
  get '/auth/github/callback', to: 'sessions#create'
  
end
