Configio::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :app_configs, except: [:show] do
    collection do
      get :search
    end
  end

  root 'app_configs#index'
end
