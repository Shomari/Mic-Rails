Rails.application.routes.draw do
  devise_for :players,  controllers: { sessions: "players/sessions", registrations: "players/registrations" }
    
  resources :players do 
    resources :recently_addeds
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'players#index'

  resources :guesses, only: [:create, :index] 
  resources :players_consoles

  resources :sessions, only: [:create, :index]
  resources :questions, only: [:show]
  resources :answer_books, only: [:create]

  get 'players/:id' => 'players#show', as: 'player_show'
  post 'question' => 'sessions#check_question', as: 'check_question' 
  get 'sessions' => 'sessions#create', as: 'sessions_create'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do 
      resources :sessions, only: [:create, :index]
    end
  end
end
