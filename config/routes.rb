IphoneNote::Application.routes.draw do
  devise_for :users
  resources :notes
  root to: 'notes#index'
end
