Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Home
  root 'home#index'
  get :dashboard, to: 'home#dashboard'

  # Profile
  get '/u/:user_id', to: 'profile#show', as: :profile
  get '/u/:user_id/edit', to: 'profile#edit', as: :edit_profile
  get '/u/:user_id/delete', to: 'profile#delete', as: :profile_delete
  # updates
  patch '/u/:user_id', to: 'profile#update', as: :update_profile
  patch '/u/:user_id/icon', to: 'profile#update_icon', as: :update_profile_icon
  patch '/u/:user_id/secure', to: 'profile#update_secure', as: :update_profile_secure
end
