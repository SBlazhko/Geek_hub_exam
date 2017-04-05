Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'places#index'
  resources :sessions, only: [:new, :create]
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :places, only: [:index, :show] do
    resources :recomendations, only: [:create] do
      post "tweet", on: :member
    end
  end
end
