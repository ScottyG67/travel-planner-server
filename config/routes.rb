Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/users/:id/saveflight', to: 'users#save_flight'
      # resources :flight_searches
      post '/search_flights', to: 'flight_searches#search'
    end
  end

end
