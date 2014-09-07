Portfolio::Application.routes.draw do

  resources :welcomes

  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'},  controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :posts do
    resources :comments
  end

  resources :projects

  # The priority is based upon order of creation: fiorst created -> highest priority.
  

  root to: 'welcome#index'

  resources :blogs, controller: 'posts'  
  
end
