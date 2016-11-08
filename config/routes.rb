Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users, only: [:new, :create, :show]
  resources :links, only: [:index, :create, :update, :edit]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # get "/links", to: "links#index"
      # post "/links", to: "links#create"
      put "/links/:id", to: "links#update"
    end
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
