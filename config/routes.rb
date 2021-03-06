Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/profile", to: "pages#profile"
  resources :reports, except: [:delete] do
    member do
      get :upvote
      get :downvote
      get :resolve
      get :reject
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
