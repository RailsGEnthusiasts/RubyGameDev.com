Rubygamedev::Application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create_from_omniauth'
  get '/auth/failure', to: 'sessions#auth_failure'

  resources :users, only: [:create, :edit, :update]
  get '/account' => 'users#edit_current_user', as: :account

  resources :posts do
    member do
      put :vote
    end
  end

  resources :comments
  resources :tags

  resources :guides
  resources :guide_categories

  resources :libraries
  resources :library_categories
  resources :tags
  resources :showcases

  get 'about' => 'pages#about', as: :about_page
  root 'pages#home'

  # Short Links
  get ':id' => 'short_links#post', as: :post_short_link, constraints: { id: /\d+/ }

end
