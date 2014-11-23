Portfolio::Application.routes.draw do

  resources :welcomes

  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'},  controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :posts do
    resources :comments
  end

  resources :projects do
    resources :comments
  end

  get '/posts/publish/:id' => 'posts#publish'
  get '/portfolio' => 'projects#portfolio', as: 'portfolio'
  get '/projects/publish/:id' => 'projects#publish'
  get 'blog', to: 'posts#index', as: :blog

  # The priority is based upon order of creation: first created -> highest priority.
  

  root to: 'welcome#index'

  resources :blogs, controller: 'posts'  
  
end
