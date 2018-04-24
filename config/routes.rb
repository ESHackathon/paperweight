Rails.application.routes.draw do
  resources :searches
  devise_for :users

  authenticated :user do
    root 'searches#index', as: :authenticated_root
  end
  root 'static_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
