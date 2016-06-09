Rails.application.routes.draw do

  #devise_for :adminusers
  devise_for :adminusers, :controllers => { registrations: 'registrations' }
  #get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  get "admin" => "admin/pages#index"
  namespace :admin do
    resources :posts
    resources :categories
    resources :images
    get 'writers', to: 'pages#writers'
  end
  #root 'admin/posts#index'
  scope module: 'frontend' do
    get "kategorien" => "pages#categories", as: "kategorien"
    get "beitrag/:id" => "pages#show", as: "beitrag"
    get "info", to: "pages#about", as: "info"
    get "impressum", to: "pages#imprint", as: "impressum"
  end

  root :to => "frontend/pages#index"
  match '*path', via: [:get, :post, :put, :options, :propfind], to: 'frontend/pages#error_404'
  match '/', via: [:options, :post, :webdav], to: 'frontend/pages#error_404'
end
