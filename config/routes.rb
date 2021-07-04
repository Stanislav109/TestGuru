Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: {sessions: 'sessions'}

  resources :gists, only: :create

  resource :feedback, only: %i[new create]
  
  resources :tests, only: :index do
    member do
      post :start
    end
  end

  # GET /test_passeges/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end    
  end
end
