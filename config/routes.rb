Rails.application.routes.draw do
  resources :warn_settings
  resources :warns do
    collection do
      get :download_csv
    end
  end
  resources :goods_warns
  resources :cars
  #root "home#index"
  root "goods_data_submissions#index"
  resources :enterprise_approvals do
    collection do
      post :approve
      post :reject
    end
  end

  resources :logins do
    collection do
      get :logout
    end
  end

  resources :goods do
    collection do
      get :dwonload_trade_csv
      get :dwonload_rate_csv
      get :chart_admin
      get :chart_enterprise
      get :key_supermarkets
      get :trade
      get :data
      get :rate
      get :supply
      get :store
      get :notice
      get :charts
    end
  end
  resources :home

  resources :enterprise_personnels do
    collection do
      get :download_csv
      post :upload_csv
      get :upload_csv_page
    end
  end
  resources :material_reserves
  devise_for :managers, controllers: {
    registrations: 'managers/registrations',
    passwords: 'managers/passwords',
    sessions: 'managers/sessions'
  }

  devise_scope :manager do
    get '/managers/sign_out' => 'devise/sessions#destroy'
  end

  resources :managers do
    collection do
      post :create_bulk
      post :create_one
    end
  end

  resources :manager_passwords do
    collection do
      get :edit_password
      post :update_password
    end
  end

  resources :goods_data_submissions do
    collection do
      post :update_status
      post :all_update_status
    end
  end
  resources :daily_goods_statistics do
    collection do
      get :upload_csv_page
      post :upload_csv
      get :download_csv
    end
  end
  resources :enterprises do
    collection do
      post :approve
      get :approval
      get :show_page
      post :reject
      get :list
      get :download_csv
      post :upload_csv
      get :upload_csv_page
    end
  end

end
