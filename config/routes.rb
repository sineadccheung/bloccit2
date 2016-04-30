Rails.application.routes.draw do

  resources :topics do
      resources :posts, except: [:index]
      resources :sponsored_posts

  end

  resources :users, only: [:new, :create]

  post 'users/confirm' => 'users#confirm'

  get 'about' => 'welcome#about'

  root 'welcome#index'


end
