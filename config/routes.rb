Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :users
  resources :books
  post 'books' => 'books#create'   #ここを追記します
  get  'homes/about'
 
end