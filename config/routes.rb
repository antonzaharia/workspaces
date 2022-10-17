Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Home
  root 'home#index'
  get :dashboard, to: 'home#dashboard'

  # Profile
  get '/u/:user_id', to: 'profile#show', as: :profile
  get '/u/:user_id/edit', to: 'profile#edit', as: :edit_profile
  patch '/u/:user_id', to: 'profile#update', as: :update_profile
end
