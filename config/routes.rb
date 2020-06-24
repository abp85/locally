Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :reports, except: [:delete] do
    member do
      get :upvote
      get :downvote
    end
    resources :votes, only: [ :create, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
