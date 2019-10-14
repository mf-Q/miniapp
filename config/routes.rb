Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root  'blogs#index'
  resources :blogs do
   resources :users
  end
  
  # get "blogs"   =>  'blogs#index'
  # get   'blogs/new'      =>  'blogs#new'             # 投稿画面
  # post  'blogs'      =>  'blogs#create'
end
