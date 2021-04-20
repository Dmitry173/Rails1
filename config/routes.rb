Rails.application.routes.draw do

  get 'sessions/new'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions

  resources :tests do
    resources :questions, shallow: true
    member do
      post :start
    end
  end

  resources :test_passages do
    member do
      get :result
    end
  end
end
