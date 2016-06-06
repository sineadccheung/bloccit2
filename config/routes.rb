Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :topics do
      resources :posts, except: [:index]
      resources :sponsored_posts
      resources :comments, only: [:create, :destroy]

  end

  resources :posts, only: [] do

      resources :comments, only: [:create, :destroy]
       resources :favorites, only: [:create, :destroy]

  end

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote

  get 'about' => 'welcome#about'

  root 'welcome#index'

  namespace :api do
     namespace :v1 do
       resources :users, only: [:index, :show, :create, :update]
       resources :topics, only: [:index, :show]
       resources :topics, except: [:edit, :new] do
         post 'create_post' => 'topics#create_post', as: :create_post
+      end
+      resources :posts, only: [:destroy, :update]
       end
     end
   end


end
