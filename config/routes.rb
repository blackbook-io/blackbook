Rails.application.routes.draw do

    #root to: 'dashboard#index'

    get '/', to: 'director#index'

    # Getting Started
    get 'get_started', to: 'get_started#user'
    get 'getting_started', to: 'get_started#owner'
    post 'get_started/ack_owner', to: 'get_started#ack_owner'
    post 'get_started/ack_user', to: 'get_started#ack_user'

    # dashboard
    get 'dashboard', to: 'dashboard#index'


    devise_for :admins, controllers: {
        sessions: 'admins/sessions',
        passwords:'admins/passwords'
    }


    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
    as :user do
      get 'signup', to: 'users/registrations#new'
      get 'signin', to: redirect('/users/sign_in')
    end

    namespace :admins do

      get 'dashboard', to: 'dashboard#index'

      resources :accounts
      resources :administrators

    end

    # ERROR HANDLERS
end
