Rails.application.routes.draw do
  resources :projects do
    resources :trees do
      resources :bubbles
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
