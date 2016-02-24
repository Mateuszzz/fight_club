Rails.application.routes.draw do

  root 'static_pages#home'
  
  get 'static_pages/home'
  
  resources :fighters, except: [:destroy, :edit, :update] do
    resources :skills, only: [:new, :create]
  end
  
  resources :fights, only: [:new, :create, :show]
end
