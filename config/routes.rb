Rails.application.routes.draw do
  root 'homes#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :post_images do
    resource :favorites, only: [:create, :destroy]
    resource :cart_images, only: [:create, :destroy]
  end
  resources :categories
  resources :shippings
  
  get '/orders/about' => 'orders#about'
  get '/orders/completion' => 'orders#completion'
  resources :orders

  get '/top' => 'homes#top'
  get '/about' => 'homes#about'

  get 'approvals/search' => 'approvals#search'
  get 'approvals/permission' => 'approvals#permission'
  post 'approvals/create' => 'approvals#create'
  get 'approvals/index' => 'approvals#index'
  get 'approvals/:approver_id/post_images/' => 'approvals#post_image_index', as: 'approver_post_images'
  get 'approvals/:approver_id/post_images/categories/:category_id' => 'approvals#post_image_index_by_category', as: 'approver_post_images_by_category'

  get '/cart_images/index' => 'cart_images#index'


  get '/post_images/categories/:category_id' => 'post_images#index_by_category', as: 'index_by_category'
end
