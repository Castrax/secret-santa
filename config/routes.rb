Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events
  resources :friends
  get :send_event_mail, to: 'events#send_event_mail', as: :send_event_mail
end
