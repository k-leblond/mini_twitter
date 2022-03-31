Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :posts, only: %i[new create destroy index]

  resources :users do
    member do
      get :following, :followers
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
