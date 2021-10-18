Rails.application.routes.draw do
  get 'sessions/new'
  get '/' => "home#top"
  get 'users/sign_up' => 'users#sign_up'
  get 'users/sign_in_page'
  get 'users/profile' => 'users#profile'
  get 'users/account' => 'users#account'
  get 'users/edit' => 'users#edit'
  post 'users/account' => 'users#account_update'
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'
  get 'reserves/reserved' => 'reserves#reserved'
  get 'reserves/post' => 'reserves#post'
  
  resources :users
  resources :reserves
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
