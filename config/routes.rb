Rails.application.routes.draw do
  # Define home route (root path)
  root "home#index"

  # Devise routes for user authentication
  devise_for :users

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Main resources for opportunities
  resources :opportunities do
    member do
      # Corrected: Moved applicants to OpportunitiesController (not ApplicationsController)
      get 'applicants', to: 'opportunities#applicants'  # List of applicants for an opportunity
    end

    # Nested applications (for applying to an opportunity)
    resources :applications, only: [:new, :create]
  end

  # Search route
  get 'search', to: 'opportunities#search', as: 'search'

  # Authenticated user routes (dashboards & role-based views)
  authenticated :user do
    # Organization dashboard
    get "organization/dashboard", to: "organization/dashboard#index", as: :organization_dashboard
    # Volunteer dashboard
    get "volunteer/dashboard", to: "volunteer/dashboard#index", as: :volunteer_dashboard

    # Organization-specific opportunities
    get "organization/opportunities", to: "opportunities#index_for_organization", as: :organization_opportunities

    # Volunteer view of all opportunities
    get "volunteer/opportunities", to: "opportunities#index_for_all", as: :volunteer_opportunities
  end
end