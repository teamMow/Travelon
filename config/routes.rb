Rails.application.routes.draw do

  get 'articles/new'
  post '/articles' => 'articles#create'
  get '/articles' => 'articles#index'
  get '/articles/:id' => 'articles#show', as: 'article'


  # get 'home/top'
  root 'home#top'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
