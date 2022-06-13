Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :comments, except: %i(new show)
  end
end
