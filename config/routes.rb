Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :new, :create, :show] do
    resources :post_comments, only: [:create]
  end

  root 'posts#index'
end
