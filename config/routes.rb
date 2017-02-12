Rails.application.routes.draw do


# homeコントローラ
  get 'home/top' => 'home#top'
  get 'home/about' => 'home#about'

# Articleコントローラ


  # get 'articles/new'
  # post '/articles' => 'articles#create'
  # get '/articles' => 'articles#index'
  
  # get '/articles/:id' => 'articles#show', as: 'article'
  get '/articles/:id/edit' => 'articles#edit', as: 'edit_article'
  patch '/articles/:id' => 'articles#update', as: 'update_article'
  delete '/article/:id' => 'articles#destroy', as: 'destroy_article'



    # デバイス用のルーティングを自動生成
    devise_for :users

    resources :users, only: [:edit, :update, :index, :destroy, :show] do
    get :likes, on: :member
    end
    resources :articles do
     resource :likes, only: [:create, :destroy]
    end

  root 'articles#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
