Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :managers, controllers: {
        sessions: 'api/v1/managers/sessions',
        registrations: 'api/v1/managers/registrations',
        confirmations: 'api/v1/managers/confirmations',
        passwords: 'api/v1/managers/passwords'
      }
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
