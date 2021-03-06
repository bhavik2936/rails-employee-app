Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      # Manager authentication endpoints
      devise_for :managers, controllers: {
        sessions: 'api/v1/managers/sessions',
        registrations: 'api/v1/managers/registrations',
        confirmations: 'api/v1/managers/confirmations',
        passwords: 'api/v1/managers/passwords'
      }
      get 'managers/authenticate', to: 'managers#authenticate'
      get 'managers/show', to: 'managers#show'

      # Employee CRUD endpoints
      resources :employees

      # misc endpoint
      get 'count', to: 'home#count'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
