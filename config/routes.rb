FakeTwitterOnRails::Application.routes.draw do
  root :to => "home#index"
<<<<<<< HEAD
  resources :user

  get "sign_up" => "user#new", :as => "sign_up"
  resources :users
=======
  resources :user do 
    resources :tweets 
  end
>>>>>>> master
end
