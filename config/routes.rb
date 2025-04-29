Rails.application.routes.draw do
  # Home route
  root "home#index"

  # Devise for user authentication
  devise_for :users

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Opportunities and nested applications
  resources :opportunities do
    member do
      get 'applicants', to: 'opportunities#applicants'  # Applicants for an opportunity
    end

    resources :applications, only: [:new, :create, :edit, :update, :index]
  end

  # Display opportunities a user has applied to
  get 'my_applications', to: 'opportunities#my_applications', as: :my_applications


  # Opportunity search
  get 'search', to: 'opportunities#search', as: 'search'

  # Authenticated user routes
  authenticated :user do
    get "organization/dashboard", to: "organization/dashboard#index", as: :organization_dashboard
    get "volunteer/dashboard", to: "volunteer/dashboard#index", as: :volunteer_dashboard

    get "organization/opportunities", to: "opportunities#index_for_organization", as: :organization_opportunities
    get "volunteer/opportunities", to: "opportunities#index_for_all", as: :volunteer_opportunities
  end
end
