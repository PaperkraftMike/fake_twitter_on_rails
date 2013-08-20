FakeTwitterOnRails::Application.routes.draw do
  root :to => "home#index"
  resources :user do
    resources :following 
    resources :tweet 
  end

  get "log_in" => "sessions#new", :as => "log_in" 
  get "log_out" => "sessions#destroy", :as => "log_out"
  post "log_in" => "sessions#create"
  resources :sessions

end
