Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        resources :trips
        resources :flights
      end
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/users/:id/saveflight', to: 'users#save_flight'
      # resources :flight_searches
      post '/search_flights', to: 'flight_searches#search'
      get '/users/:id/trips/:id/flights', to: 'flights#trip_flights'
    end
  end

end
