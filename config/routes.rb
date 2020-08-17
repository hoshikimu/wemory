Rails.application.routes.draw do
  root 'homes#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :post_images
  resources :categories

  get '/top' => 'homes#top'
  get '/about' => 'homes#about'

  get '/search' => 'approvals#search'
  get '/permission' => 'approvals#permission'
end
