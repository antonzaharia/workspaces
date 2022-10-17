Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Home
  root 'home#index'
  get :dashboard, to: 'home#dashboard'
end
