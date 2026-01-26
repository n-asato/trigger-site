Rails.application.routes.draw do
  root 'home#index'

  get '/about', to: 'pages#about'
  get '/service', to: 'services#index'
  get '/services/:service_type', to: 'services#show', as: :service_detail

  resources :contacts, only: [:new, :create], path_names: { new: '' }, path: 'contact' do
    collection do
      get :thanks
    end
  end

  
  resources :works, only: [:index, :show], param: :slug

  namespace :admin do
    root to: 'works#index'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    
    resources :works
  end
end
