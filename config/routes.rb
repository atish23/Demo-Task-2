Rails.application.routes.draw do
  resources :galleries, :except => [:show]
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'dashboard#index'

end
