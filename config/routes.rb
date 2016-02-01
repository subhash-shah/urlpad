Rails.application.routes.draw do
  devise_for :users
  get "/links/search_results", to: "links#search_links_by_tag", as: :links_search
  resources :links
  resources :tags
  get "/dashboard", to: "dashboard#index", as: :dashboard
  root "dashboard#index"
end
