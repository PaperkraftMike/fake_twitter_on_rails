FakeTwitterOnRails::Application.routes.draw do
  root :to => "home#index"
  resources :user

  get "sign_up" => "user#new", :as => "sign_up"
  resources :users
end
