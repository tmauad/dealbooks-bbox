# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  devise_for(
    :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      confirmation: 'confirmation',
      unlock: 'unlock',
      registration: '',
      sign_up: 'signup'
    },
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  )

end
