Rails.application.routes.draw do
  # Define home route (root path)
  root "home#index"

  # Devise routes for user authentication
  devise_for :users

  # Health check route for load balancers and uptime monitoring
  get "up" => "rails/health#show", as: :rails_health_check

  # Resources for opportunities
  resources :opportunities do
    member do
      get :applications  # Custom list of applications for a single opportunity
    end

    # Nested resource for applications (for applying to an opportunity)
    resources :applications, only: [:new, :create]
  end

  # Search route
  get 'search', to: 'opportunities#search', as: 'search'

  # Authenticated user routes (dashboard based on user role)
  authenticated :user do
    # Organization dashboard route - only accessible by organization users
    get "organization/dashboard", to: "organization/dashboard#index", as: :organization_dashboard
    # Volunteer dashboard route - only accessible by volunteer users
    get "volunteer/dashboard", to: "volunteer/dashboard#index", as: :volunteer_dashboard

    # Custom route for organizations to see only their opportunities
    get "organization/opportunities", to: "opportunities#index_for_organization", as: :organization_opportunities

    # Custom route for volunteers to see all opportunities
    get "volunteer/opportunities", to: "opportunities#index_for_all", as: :volunteer_opportunities
  end

  # Fallback or catch-all route for other cases
  # root "posts#index"  # Uncomment and modify if needed for default root path
end
