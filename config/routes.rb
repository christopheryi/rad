Rails.application.routes.draw do
  get 'welcome/homepage'
  root to: 'welcome#homepage'
  resources :users
  resources :reetchers
  resources :reetcher_sessions, only: [ :new, :create, :destroy ]
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :reads
 
  get 'login'  => 'reetcher_sessions#new'
  get 'logout' => 'reetcher_sessions#destroy'
end
