FakeTwitterOnRails::Application.routes.draw do
  root :to => "home#index"
  resources :user do 
    resources :tweets 
  end

  get "log_in" => "sessions#new"
  resources :users
  resources :sessions

end
