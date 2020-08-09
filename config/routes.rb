Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to 'basses#index'
  resources :basses, only: [:index, :show, :new, :create] do
    resources :songs, only: [:new, :create]
    resources :comments, only: [:new, :create]
  end
end
