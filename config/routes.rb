Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/spotify_track', to: 'spotify_track#create'
  get '/', to: 'home#index'
  get '/auth/spotify/callback', to: 'users#spotify'
end
