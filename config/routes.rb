Prairie::Application.routes.draw do
  use_doorkeeper do
    controllers authorizations: "authorization/authorizations",
                applications:   "authorization/applications"

    skip_controllers [:applications, :authorized_applications]
  end

  match "/", to: "home#index", via: [:post, :get]
  root to: "home#index"

  %w(about).each do |page|
    get page, to: "home##{page}", as: page
  end

  resources :activities, :partners

  resources :subscriptions do
    collection do
      get "unsubscribe"
    end
  end

  resources :events do
    resources :tickets, shallow: true do
      collection do
        get "quick_attend"
      end
    end
  end

  # Devise Routes for Users
  devise_for :users, controllers: {
    confirmations:      "authentication/confirmations",
    invitations:        "authentication/invitations",
    passwords:          "authentication/passwords",
    registrations:      "authentication/registrations",
    sessions:           "authentication/sessions",
    unlocks:            "authentication/unlocks"
  }

  resources :users do
    member do
      patch "set_password"
    end
  end

  # LetterOpener for Emails
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/email"

    require "sidekiq/web"
    mount Sidekiq::Web => "/sidekiq"
  end
end
