Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  devise_for :users, defaults: { format: :json }, path: '', path_names: {
    sign_in: 'api/v1/login', sign_out: 'api/v1/logout', registration: 'api/v1/signup'
  },
  controllers: {
     sessions: 'api/v1/sessions', registrations: 'api/v1/registrations'
  }

  # We build api with version from the start in case of using multiple versions in the future.
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :products
    end
  end
end
