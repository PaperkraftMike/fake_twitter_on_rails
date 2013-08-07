FakeTwitterOnRails::Application.routes.draw do
  root :to => "home#index"
  resources :user do 
    resources :tweets 
  end
end
