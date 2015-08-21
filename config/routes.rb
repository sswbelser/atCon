Rails.application.routes.draw do

	root "conferences#index"
  
	resources :users, only: [:create, :update, :index, :destroy]
	get "/signup", to: "users#new", as: :signup
	get "/profile", to: "users#show", as: :profile
	get "/edit-profile", to: "users#edit", as: :edit_profile

	resources :sessions, only: [:create]
	get "/login", to: "sessions#new", as: :login
	get "/logout", to: "sessions#destroy", as: :logout

	resources :conferences, only: [:index, :show]

	resources :events
	resources :posts , except: [:index, :show] do
		resources :comments
	end

	resources :rsvp , only: [:create]
end

