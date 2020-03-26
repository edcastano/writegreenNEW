Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shares

  root "letters#new"
  resources :sentences
  resources :letters
  get 'letter', to: "letters#show", :as => 'letter'
  get 'home', to: "letters#new"
  get 'edit', to: "letters#edit"
end
