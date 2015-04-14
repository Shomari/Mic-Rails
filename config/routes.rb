Rails.application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'

  devise_for :players,  controllers: { sessions: "players/sessions", registrations: "players/registrations" }
    
  resources :players do 
    resources :recently_addeds do 
      resources :guesses, only: [:create, :index] 

    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'players#index'

  # mount Forem::Engine, :at => "/"
  # root :to => "forem/forums#index"

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
