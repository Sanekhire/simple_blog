# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  resources :articles do
    resources :comments, except: %i[new show]
  end
end
