Rails.application.routes.draw do

# Articleコントローラ
  get 'articles/new'
  # post '/articles' => 'articles#create'
  # get '/articles' => 'articles#index'
  get '/articles/:id' => 'articles#show', as: 'article'
  get '/articles/:id/edit' => 'articles#edit', as: 'edit_article'
  patch '/articles/:id' => 'articles#update', as: 'update_article'
  delete '/article/:id' => 'articles#destroy', as: 'destroy_article'

  resources :articles


# homeコントローラ
  # get 'home/top'
  root 'articles#index'

  

  # デバイス用のルーティングを自動生成
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:edit, :update, :index, :destroy, :show]


end
