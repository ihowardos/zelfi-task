Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :events
  resources :event_registrations, only: %i(create)

  root to: "pages#home"
end
