Rails.application.routes.draw do
  resources :galleries
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'dashboard#index'

end
