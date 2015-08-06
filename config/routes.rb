Rails.application.routes.draw do

  root 'people#index'

  resources :people do
    resources :measurements
  end
end
