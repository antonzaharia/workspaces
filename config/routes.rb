Rails.application.routes.draw do

  constraints(SubdomainRoutes) do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
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
    
    # Workspaces
    resources :workspaces, only: [:new, :create, :destroy] do
      get :delete
    end
  end

  # Workspaces pages
  constraints(!SubdomainRoutes) do
    scope module: :workspaces do 
      get '/', to: 'pages#show', as: :workspace_home

      resources :workspace_users do 
        get :delete
      end
    end
  end
end
