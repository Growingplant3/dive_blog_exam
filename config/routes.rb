Rails.application.routes.draw do
  resources :blogs do
    post :confirm, on: :collection
  end
  root 'blogs#index'
end
