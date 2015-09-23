Rails.application.routes.draw do
	resources :users

	get "signup" => "users#new", :as => "signup"
	get 'login' => 'sessions#new'
	post "login" => "sessions#create"
	get "logout" => "sessions#destroy", :as => "logout"
