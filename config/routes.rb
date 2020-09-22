Rails.application.routes.draw do
  root 'homes#about'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :post_images do
    resource :favorites, only: [:create, :destroy]
    resource :cart_images, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy, :index]
  end
  resources :categories, except: [:index, :show]
  resources :shippings, except: [:index, :show]
  
  get '/orders/about' => 'orders#about'
  get '/orders/completion' => 'orders#completion'
  resources :orders, except: :edit
  resources :notifications, only: :index

  get '/top' => 'homes#top'
  get '/slide_image' => 'homes#slide_image'
  get '/about' => 'homes#about'

  get 'approvals/search' => 'approvals#search'
  get 'approvals/permission' => 'approvals#permission'
  post 'approvals/create' => 'approvals#create'
  get 'approvals/index' => 'approvals#index'
  get 'approvals/:approvered_id/edit' => 'approvals#edit', as: 'approvered_edit'
  patch 'approvals/:approvered_id' => 'approvals#update', as: 'approvered_update'
  delete 'approvals/:approvered_id' => 'approvals#destroy', as: 'approvered_destroy'
  get 'approvals/:approver_id/post_images/' => 'approvals#post_image_index', as: 'approver_post_images'
  get 'approvals/:approver_id/post_images/categories/:category_id' => 'approvals#post_image_index_by_category', as: 'approver_post_images_by_category'

  get '/cart_images/index' => 'cart_images#index'
  delete '/cart_images/destroy_all' => 'cart_images#destroy_all', as: 'cart_images_destroy_all'

  get '/post_images/categories/:category_id' => 'post_images#index_by_category', as: 'index_by_category'

  get 'contacts/contact' => 'contacts#contact'
  post 'contacts/create' => 'contacts#contact_create'
end
