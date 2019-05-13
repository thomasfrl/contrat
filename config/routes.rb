Rails.application.routes.draw do
  root to: "fights#index"
  resources :fights, except: [:update, :edit, :destroy]
  resources :fighters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
