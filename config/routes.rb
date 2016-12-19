Rails.application.routes.draw do
  get 'welcome/homepage'
  root to: 'welcome#homepage'

  resources :reetchers
  resources :reetcher_sessions, only: [ :new, :create, :destroy ]

  get 'login'  => 'reetcher_sessions#new'
  get 'logout' => 'reetcher_sessions#destroy'
end
