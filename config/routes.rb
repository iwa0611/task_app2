Rails.application.routes.draw do
  get 'sessions/new'
  get '/' => "home#top"
  get 'users/sign_up' => 'users#sign_up'
  get 'users/sign_in_page'
  get 'users/profile' => 'users#profile'
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'
  
  resources :users
  resources :reserves
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
