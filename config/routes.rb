Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"

  resources :skills, only: [:index, :show]
  resources :learning_paths, only: [:create, :show, :destroy] do
    resources :milestones, only: [] do
      member do
        patch :mark_complete
      end
    end
  end

  post '/dashboard', to: 'learning_paths#create_from_skill', as: :create_learning_path_from_skill

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
