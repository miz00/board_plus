Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :my_threads do
    resources :comments, controller: "my_threads/comments"
  end
  root :to => "my_threads#index"
end
